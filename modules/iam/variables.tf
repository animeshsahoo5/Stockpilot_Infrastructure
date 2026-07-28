variable "name_prefix" {
  description = "Prefix used for naming IAM resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to IAM resources"
  type        = map(string)
}
