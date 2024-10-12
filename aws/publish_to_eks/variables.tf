variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "function_name" {
  description = "Function Name"
  type        = string
  default     = "function-java"
}

variable "image_name" {
  description = "Image Name"
  type        = string
  default     = "lenneflow/function-java"
}

variable "container_port" {
  description = "host_port"
  type        = string
  default     = "8080"
}

variable "host_port" {
  description = "assigned_port"
  type        = string
  default     = "47000"
}