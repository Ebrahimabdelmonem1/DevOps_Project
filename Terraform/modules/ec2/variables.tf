# Subnet ID for the EC2 instance
variable "subnet_id" {
  type        = string
  description = "Private subnet ID for the EC2 instance"
}

# Security groups attached to the EC2 instance
variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
}

# SSH key pair name
variable "key_name" {
  type        = string
  description = "Name of the AWS key pair"
}