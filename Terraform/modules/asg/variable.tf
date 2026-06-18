variable "private_subnets" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ami" {
  type = string
}

variable "tg_arn" {
  type = string
}