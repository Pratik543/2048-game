#!/bin/bash
set -e

# Install Docker
sudo apt update -y
sudo curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable --now docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker

# Java
sudo apt install -y fontconfig openjdk-21-jre

# Add Jenkins repository and install Jenkins
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable --now jenkins
sudo systemctl start jenkins

# Terraform
sudo apt install -y gnupg software-properties-common
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install -y terraform

# AWS CLI
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/home/ubuntu/awscliv2.zip"
sudo apt install -y unzip
sudo unzip /home/ubuntu/awscliv2.zip
sudo /home/ubuntu/aws/install -i /usr/local/aws-cli -b /usr/local/bin --update
