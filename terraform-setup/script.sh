#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y curl unzip gnupg software-properties-common

curl -fsSL https://get.docker.com/ | sh
systemctl enable --now docker
systemctl start docker