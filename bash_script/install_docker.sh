#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."

    # Update package list
    sudo apt update

    # Install prerequisites
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

    # Add Docker’s GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up the stable repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update again and install Docker
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

# Enable and start Docker
echo "Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Docker setup complete."
