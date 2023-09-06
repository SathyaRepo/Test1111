#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Add Brave's APT repository and key
curl -fsSLo /usr/share/keyrings/brave-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-archive-keyring.gpg arch=armhf] https://brave-browser-apt-release.s3.brave.com/ stable main" > /etc/apt/sources.list.d/brave-browser.list

# Update package lists
apt update

# Install Brave browser
apt install -y brave-browser

# Clean up
rm /usr/share/keyrings/brave-archive-keyring.gpg
rm /etc/apt/sources.list.d/brave-browser.list

# Display installation completion message
echo "Brave browser has been successfully installed on your Raspberry Pi 4."
