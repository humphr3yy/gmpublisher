#!/bin/bash

# gmpublisher_dependencies.sh
# This script installs necessary dependencies for GMPublisher on Linux systems.

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y \
    libwebkit2gtk-4.0-dev \
    libgtk-3-dev \
    libappindicator3-dev \
    libayatana-appindicator3-dev

# Check for libwebkit2gtk version and create symbolic links if necessary
WEBKIT_VERSION=$(dpkg -l | grep libwebkit2gtk | awk '{print $3}')
if [[ $WEBKIT_VERSION == 4.1* ]]; then
    echo "Detected libwebkit2gtk version 4.1. Creating symbolic links for compatibility..."
    sudo ln -sf /usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.1.so.0 /usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37
    sudo ln -sf /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.1.so.0 /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.0.so.18
else
    echo "libwebkit2gtk version 4.0 detected. No symbolic links needed."
fi

echo "All dependencies have been installed and configured."
