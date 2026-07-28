locals {

  # Common name prefix for all AWS resources
  name_prefix = "${var.project_name}-${var.environment}"

  # Common tags applied to every AWS resource
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
