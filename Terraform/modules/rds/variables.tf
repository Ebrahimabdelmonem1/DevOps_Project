# Subnet IDs used for the database subnet group
variable "db_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for RDS"
}

# Security group for the database
variable "db_sg_id" {
  type        = string
  description = "Security group ID for RDS"
}

# Database username
variable "db_username" {
  type        = string
  description = "Master username for the database"
  default     = "admin"
}

# Database password
variable "db_password" {
  type        = string
  description = "Master password for the database"
  sensitive   = true
}

# Database instance class
variable "db_instance_class" {
  type        = string
  description = "Instance type for RDS"
  default     = "db.t3.micro"
}
variable "private_subnets" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}
