🚀 DevOps End-to-End AWS Deployment Project

This project demonstrates a complete Infrastructure as Code (IaC) and CI-style deployment pipeline using:

Terraform (Infrastructure provisioning)
Ansible (Configuration management)
AWS (Cloud infrastructure)
Docker (Application containerization)
Nginx (Web server / Reverse proxy)
Application Load Balancer (ALB)
📌 Architecture Overview

The system consists of:

Bastion Host (Public Subnet)
Private EC2 Instance (App Server)
Application Load Balancer (ALB)
Dockerized Nginx Web Server

Traffic Flow:

User → ALB → EC2 (Private) → Docker Nginx → Web Page
🛠️ Technologies Used
Terraform
Ansible
AWS EC2, VPC, ALB, Security Groups
Ubuntu 22.04 LTS
Docker
Nginx
📁 Project Structure
project/
│
├── terraform/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── security-groups/
│
├── ansible/
│   ├── inventory.ini
│   ├── playbook.yml
│   ├── templates/
│   │   └── default.j2
│   └── files/
│       └── index.html
│
└── README.md
⚙️ Infrastructure Setup (Terraform)

Terraform is used to create:

VPC with public & private subnets
Bastion host in public subnet
Private EC2 instance for application
Security Groups
Application Load Balancer
Run Terraform:
cd terraform
terraform init
terraform apply -auto-approve
🔧 Configuration Management (Ansible)

Ansible is used to:

Install Docker
Install Nginx
Deploy HTML page
Run Docker container
Configure web server
Inventory Example:
[bastion_hosts]
bastion ansible_host=<public-ip> ansible_user=ubuntu ansible_ssh_private_key_file=key.pem

[private]
app ansible_host=<private-ip> ansible_user=ubuntu ansible_ssh_private_key_file=key.pem

[private:vars]
ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i key.pem ubuntu@<bastion-ip>"'
Run Ansible:
ansible-playbook -i inventory.ini playbook.yml
🌐 Web Deployment

A simple HTML page is deployed:

<h1>Welcome to SEB's Cafe ☕</h1>

It is served using Nginx inside a Docker container.

🐳 Docker Configuration

The web server runs inside a container:

ports:
  - "80:80"

This ensures:

EC2 port 80 → Docker port 80
ALB can reach the service directly
⚖️ Load Balancer (ALB)
Routes traffic to EC2 instances
Listens on port 80
Uses target group pointing to EC2
🚨 Common Issues Fixed
❌ 502 Bad Gateway

Cause:

Port mismatch between ALB and EC2/Docker

Fix:

Ensure all services use port 80 consistently
❌ Port already in use

Cause:

Nginx + Docker using same port

Fix:

Stop host nginx OR change container port mapping
❌ Ansible module errors (PEP 668)

Fix:

Install required packages via apt instead of pip system-wide
🧪 Testing
Check EC2 container:
docker ps
Test locally:
curl http://localhost
Test ALB:

Open browser:

http://<alb-dns-name>
🎯 Result

After deployment:

Infrastructure fully automated
App deployed via Ansible
Web accessible via ALB
Dockerized Nginx serving static page
👨‍💻 Author

DevOps Engineer: Ibrahim
Stack: AWS | Terraform | Ansible | Docker | Linux | CI/CD