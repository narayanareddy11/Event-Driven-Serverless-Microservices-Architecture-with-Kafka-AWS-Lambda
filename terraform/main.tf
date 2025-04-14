
resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = var.cluster_name
  kafka_version          = "2.8.1"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    client_subnets  = ["subnet-xxxxxxxx", "subnet-yyyyyyyy", "subnet-zzzzzzzz"]
    security_groups = ["sg-xxxxxxxx"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "LambdaMSKExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaMSKExecutionRole"
}

resource "aws_lambda_function" "fraud_detection" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "app.lambda_handler"
  runtime       = "python3.8"
  filename      = "${path.module}/../lambda_functions/fraud_detection/deployment_package.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda_functions/fraud_detection/deployment_package.zip")

  environment {
    variables = {
      KAFKA_TOPIC = var.kafka_topic_name
    }
  }
}

resource "aws_lambda_event_source_mapping" "mks_trigger" {
  event_source_arn = aws_msk_cluster.msk_cluster.arn
  function_name    = aws_lambda_function.fraud_detection.arn
  enabled          = true
}
