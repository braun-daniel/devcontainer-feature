#!/usr/bin/env bash
# This script installs fzf and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Install git
echo "Installing git..."
apt-get update
apt-get install -y git

# Change to remote user
echo "Changing to remote user..."
su - "$_REMOTE_USER"

# Clone the fzf repository into the remote user's home directory
echo "Cloning fzf repository..."
git clone --depth 1 https://github.com/junegunn/fzf.git "${_REMOTE_USER_HOME}/.fzf"

# Run the fzf install script
echo "Running fzf install script..."
$REMOTE_USER_HOME/.fzf/install --all