variable "project_name" {
  type        = string
  default     = "2048-Game"
  description = "The name of the project, used for tagging resources"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "instance_type" {
  type        = string
  default     = "t3.small" # 't3.micro'=1GB Mem 't3.small'=2GB Mem 'c7i-flex.large'=4GB Mem 'm7i-flex.large'=8GB Mem for EC2 instance(Free tier eligible)
  description = "The instance type to use for the EC2 instance"
}

variable "ami_id" {
  type        = string
  default     = "" # Replace with the latest Ubuntu AMI 'ami-019715e0d74f695be'
  description = "The AMI ID to use for the EC2 instance"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "The key name to use for the EC2 instance"
}

variable "region" {
  type        = string
  default     = ""
  description = "AWS region to deploy resources in"
}
