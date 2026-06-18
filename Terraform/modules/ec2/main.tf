# Private EC2
resource "aws_instance" "app" {
  ami           = "ami-05cf1e9f73fbad2e2"
  instance_type = "t3.micro"

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_groups

  associate_public_ip_address = false

  key_name = var.key_name

  tags = {
    Name = "Private-Server"
  }
}