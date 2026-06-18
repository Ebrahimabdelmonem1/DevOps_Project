variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "key_name" {
  description = "key pair"
}
variable "db_password" {
  type      = string
  sensitive = true
}
#variable "private_subnets" {
#  type = list(string)
#}