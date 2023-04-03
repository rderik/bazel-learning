output "ecr_arn" {
  value       = aws_ecr_repository.main.arn
  description = "ECR ARN"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.main.repository_url
  description = "ECR Repository URL"
}
