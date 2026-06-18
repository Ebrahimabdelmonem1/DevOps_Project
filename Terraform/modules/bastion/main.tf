# Bastion Host
resource "aws_instance" "bastion" {
  ami           = "ami-05cf1e9f73fbad2e2"
  instance_type = "t3.micro"

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.sg_id]  

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "Bastion-Host"
  }
}