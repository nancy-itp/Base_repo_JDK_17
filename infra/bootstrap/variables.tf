variable "region" {
  description = "AWS region for the state bucket."
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Prefix used in names and tags."
  type        = string
  default     = "trebol-poc"
}

variable "noncurrent_version_days" {
  description = "Days to keep old versions of state files before S3 deletes them."
  type        = number
  default     = 30
}

variable "owner" {
  description = "Owner tag required by the cloud team (name or email)."
  type        = string
  default     = "nancy.vaghela"
}
