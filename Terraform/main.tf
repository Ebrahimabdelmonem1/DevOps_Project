# Provider
provider "aws" {
  region  = var.region
  profile = "terraform"
}

# VPC
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

# Security Groups
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

# Bastion Host (Public subnet)
module "bastion" {
  source = "./modules/bastion"

  subnet_id = module.vpc.public_subnet_ids[0]
  sg_id     = module.sg.bastion_sg_id
  key_name  = var.key_name
}

# Private EC2
module "ec2" {
  source = "./modules/ec2"

  subnet_id       = module.vpc.private_subnet_ids[0]
  security_groups = [module.sg.ec2_sg_id]
  key_name        = var.key_name
}

# RDS
module "rds" {
  source = "./modules/rds"

  private_subnets = module.vpc.private_subnet_ids
  db_subnet_ids   = module.vpc.private_subnet_ids
  db_sg_id        = module.sg.rds_sg_id
  db_password     = var.db_password
}
#ALB
module "alb" {
  source         = "./modules/alb"
  public_subnets = module.vpc.public_subnet_ids
  sg_id          = module.sg.ec2_sg_id
  vpc_id         = module.vpc.vpc_id
}
#ASG
module "asg" {
  source          = "./modules/asg"
  private_subnets = module.vpc.private_subnet_ids
  sg_id           = module.sg.ec2_sg_id
  key_name        = var.key_name
  ami             = "ami-0c02fb55956c7d316"
  tg_arn          = module.alb.tg_arn
}