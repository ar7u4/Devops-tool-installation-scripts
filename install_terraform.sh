#!/bin/bash

# Step 1: Import the HashiCorp GPG key
wget -q -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Step 2: Add HashiCorp repository to APT sources
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 3: Update APT and Install Terraform
sudo apt update
sudo apt install terraform

# Check if Terraform is installed successfully
if command -v terraform &>/dev/null; then
    echo "Terraform is installed successfully."
else
    echo "Terraform installation failed."
fi
