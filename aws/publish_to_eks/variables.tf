variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Cluster version"
  type        = string
  default     = "1.31"
}

variable "node_group_desired_size" {
  description = "node_group_desired_size"
  type        = string
  default     = "1"
}

variable "node_group_min_size" {
  description = "node_group_min_size"
  type        = string
  default     = "1"
}

variable "node_group_max_size" {
  description = "node_group_max_size"
  type        = string
  default     = "2"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t2.medium"
}

variable "ami_type" {
  description = "ami_type"
  type        = string
  default     = "AL2_x86_64"
}