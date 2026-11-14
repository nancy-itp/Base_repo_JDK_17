output "vpc_id" {
  value = aws_vpc.main.id
}

output "availability_zones" {
  value = local.azs
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "app_subnet_ids" {
  value = aws_subnet.app[*].id
}

output "db_subnet_ids" {
  value = aws_subnet.db[*].id
}

output "nat_gateway_public_ips" {
  description = "Outbound IPs of the ECS tasks (useful if a third party needs to allow-list them)"
  value       = aws_eip.nat[*].public_ip
}

output "lab_status" {
  value = var.lab_on ? "ON - hourly-billed resources are running" : "OFF - only free/near-free resources exist"
}

output "ecr_repository_url" {
  description = "Push images here: <url>:<tag>"
  value       = aws_ecr_repository.app.repository_url
}

output "db_secret_arn" {
  description = "Secrets Manager ARN of the DB credentials (values are not printed)"
  value       = aws_secretsmanager_secret.db.arn
}

output "jwt_secret_arn" {
  description = "Secrets Manager ARN of the JWT signing key (value is not printed)"
  value       = aws_secretsmanager_secret.jwt.arn
}
