#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y curl unzip gnupg software-properties-common

apt-get install -y docker.io
systemctl enable --now docker
systemctl start docker