# Subnet where the bastion host will be deployed
variable "subnet_id" {
  type        = string
  description = "Public subnet ID for the bastion host"
}

# Security group attached to the bastion host
variable "sg_id" {
  type        = string
  description = "Security group ID for the bastion host"
}

# SSH key pair name used to access the bastion host
variable "key_name" {
  type        = string
  description = "Name of the AWS key pair"
}