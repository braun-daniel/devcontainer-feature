#!/usr/bin/env bash
# This script installs fzf and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Install git
echo "Installing git..."
apt-get update
apt-get install -y git

# Install fzf
su - "$_REMOTE_USER" -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${_REMOTE_USER_HOME}/.fzf"
su - "$_REMOTE_USER" -c "${_REMOTE_USER_HOME}/.fzf/install"