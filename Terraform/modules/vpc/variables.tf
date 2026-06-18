# CIDR block for the main VPC
variable "vpc_cidr" {
  type        = string
  description = "CIDR block used to create the VPC"
}

# CIDR block for the public subnet
variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

# CIDR block for the private subnet
variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}