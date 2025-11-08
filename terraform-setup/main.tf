terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"  # Change this to your preferred region
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-02b8269d5e85954ef" # Replace with the latest Ubuntu AMI
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ad1bc27c4fba4017"] # Replace it with the security group of 2048-Jenkins-Terraform-Automation
  key_name      = "admin"  # Replace with your Key-name
  tags = {
    Name = "Terraform-Jenkins-Server"
  }
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}