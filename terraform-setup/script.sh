#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y
sudo apt-get install -y curl unzip gnupg software-properties-common

sudo apt-get install -y docker.io
sudo systemctl enable --now docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu