output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the VPC"
}

output "security_group_id" {
  value       = aws_default_security_group.default.id
  description = "ID of the default security group"
}

output "instance_public_ip" {
  value       = aws_instance.jenkins_server.public_ip
  description = "Public IP of the Jenkins server and the EC2 instance"
}