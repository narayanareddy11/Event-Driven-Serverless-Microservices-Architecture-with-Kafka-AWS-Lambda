
variable "aws_region" {
  description = "The AWS region for deployment"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the MSK cluster"
  default     = "fraud-detection-msk"
}

variable "lambda_function_name" {
  description = "Name of the Fraud Detection Lambda Function"
  default     = "FraudDetectionFunction"
}

variable "kafka_topic_name" {
  description = "Kafka topic to subscribe for events"
  default     = "fraud-transactions"
}
