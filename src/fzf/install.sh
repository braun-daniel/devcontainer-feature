#!/usr/bin/env bash
# This script installs fzf and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Update package lists and install fzf
echo "Updating package lists and installing fzf..."
apt-get update -y && apt-get install -y fzf

# Clean up unnecessary packages and cache
echo "Cleaning up unnecessary packages and cache..."
apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify the installation
echo "Verifying installation..."
if command -v fzf --version >/dev/null 2>&1; then
    echo "fzf installed successfully."
else
    echo "Error: fzf installation failed." >&2
    exit 1
fi