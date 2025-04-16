variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "eu-west-1"
}

variable "subnet_ids" {
  description = "List of subnet IDs to deploy resources into."
  type        = list(string)
  default     = ["subnet-00ba4f66dc26bcc8f", "subnet-0f956ed4384bb8fbb"]
}

variable "node_subnet_ids" {
  description = "List of subnet IDs for the node group."
  type        = list(string)
  default     = ["subnet-00ba4f66dc26bcc8f", "subnet-0f956ed4384bb8fbb"]
}
