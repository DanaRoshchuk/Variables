variable "ecr_repo_name" {
  validation {
    condition     = var.ecr_repo_name == lower(var.ecr_repo_name)
    error_message = "ECR repository name cannot be in uppercase"
  }
}
