variable "ami_id" {
  description = "AMI ID for Amazon Linux 2023"
  type        = string
  default     = "ami-06ee6255945a96aba"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-012b0469866ac008b"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-0f318e9f0ed0cbba3"
}
