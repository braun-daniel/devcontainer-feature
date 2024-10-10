#!/usr/bin/env bash
# This script installs spaceship-prompt into the DevContainer user's home directory.

# Exit script on any error
set -e

# Install ZSH
echo "Installing ZSH..."
apt-get update
apt-get install -y zsh

# Change to remote user
echo "Changing to remote user..."
su - "$_REMOTE_USER"

# Create the .zsh directory if it doesn't exist
mkdir -p "${_REMOTE_USER_HOME}/.zsh"

# Clone the spaceship-prompt repository into the .zsh directory
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "${_REMOTE_USER_HOME}/.zsh/spaceship"

# Make sure the spaceship-prompt is permanently sourced in the .zshrc file
echo 'source "${_REMOTE_USER_HOME}/.zsh/spaceship/spaceship.zsh"' >> "${_REMOTE_USER_HOME}/.zshrc"