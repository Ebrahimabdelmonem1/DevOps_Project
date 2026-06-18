output "bastion_ip" {
  value = module.bastion.bastion_ip
}

output "rds_endpoint" {
  value = module.rds.endpoint
}