output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.app.public_ip
}

output "instance_public_dns" {
  description = "DNS público da instância EC2"
  value       = aws_instance.app.public_dns
}

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.app.id
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 de artefatos"
  value       = aws_s3_bucket.artifacts.bucket
}

output "s3_bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.artifacts.arn
}

output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}

output "app_url" {
  description = "URL de acesso à aplicação"
  value       = "http://${aws_instance.app.public_ip}:3000"
}
