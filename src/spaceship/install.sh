#!/usr/bin/env bash
# This script installs spaceship-prompt into the DevContainer user's home directory.

# Exit script on any error
set -e

# Install ZSH
echo "Installing dependencies..."
apt-get update
apt-get install -y zsh git

# Change to remote user
echo "Changing to remote user..."

# Install spaceship-prompt
mkdir -p "${_REMOTE_USER_HOME}/.zsh"
su - "$_REMOTE_USER" -c "git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git ~/.zsh/spaceship"
su - "$_REMOTE_USER" -c "echo 'source \"~/.zsh/spaceship/spaceship.zsh\"' >> \"~/.zshrc\""