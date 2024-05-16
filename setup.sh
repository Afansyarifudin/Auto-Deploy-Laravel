#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Set Timezone to Asia/Jakarta
echo "Setting timezone to Asia/Jakarta..."
sudo timedatectl set-timezone Asia/Jakarta

# Install Git, Curl, ZIP, Python3 and Python3-pip
echo "Installing Git, Curl, ZIP, Python3 and Python3-pip..."
sudo apt-get install -y git curl zip python3 python3-pip

# Install Docker
echo "Installing Docker..."
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add current user to the docker group
echo "Adding user to the docker group..."
sudo usermod -aG docker $USER
newgrp docker

# Configure Git
echo "Configuring Git..."
git config --global user.name "afansyarifudin"
git config --global user.email "afan.syarifudin10@gmail.com"

echo "Server setup is complete!"
