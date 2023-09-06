#!/bin/bash

# Check if Snap is installed
if ! command -v snap &> /dev/null; then
    echo "Snap is not installed. Installing Snap..."
    sudo apt update
    sudo apt install snapd -y
fi

# Install Brave browser using Snap
echo "Installing Brave browser..."
sudo snap install brave

# Verify the installation
if snap list | grep -q brave; then
    echo "Brave browser has been successfully installed."
else
    echo "Failed to install Brave browser."
fi
