
output "msk_cluster_arn" {
  value = aws_msk_cluster.msk_cluster.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.fraud_detection.function_name
}
