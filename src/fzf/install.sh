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

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install