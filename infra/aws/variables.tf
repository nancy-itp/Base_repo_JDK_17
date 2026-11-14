variable "project" {
  description = "Name prefix for all resources"
  type        = string
  default     = "trebol-poc"
}

variable "owner" {
  description = "Owner tag on every resource"
  type        = string
  default     = "nancy.vaghela"
}

variable "region" {
  description = "AWS region (us-east-1 also hosts the CloudFront WAF rules)"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Address range for the whole VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "az_count" {
  description = "Number of Availability Zones to spread across"
  type        = number
  default     = 2
}

variable "lab_on" {
  description = <<-EOT
    Switch for everything that is billed by the hour (NAT gateway, and in later steps the database,
    RDS Proxy, load balancer, ECS service, CloudFront and WAF).
    false (default) = lab off: only free or near-free resources exist (VPC, subnets, ECR, secrets).
    true            = lab on: the full stack runs. Start with lab-up.cmd, stop with lab-down.cmd.
    The default is false so a plain `terraform apply` can never leave costly resources running by accident.
  EOT
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = <<-EOT
    true  = one NAT gateway shared by both zones (about $33/month; if its zone fails, tasks in the
            other zone lose outbound internet until it recovers, but keep serving traffic).
    false = one NAT gateway per zone (double the cost, no shared dependency).
  EOT
  type        = bool
  default     = true
}

variable "ecr_keep_images" {
  description = "How many images ECR keeps; older ones are deleted automatically."
  type        = number
  default     = 10
}

variable "ecr_force_delete" {
  description = "Allow Terraform to delete the ECR repository even if it holds images (final teardown only)."
  type        = bool
  default     = false
}

variable "db_username" {
  description = "MariaDB master user name."
  type        = string
  default     = "trebol_admin"
}

variable "db_name" {
  description = "Database (schema) the app uses; Flyway creates the tables in it."
  type        = string
  default     = "trebol"
}
