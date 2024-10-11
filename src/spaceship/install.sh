#!/usr/bin/env bash
# This script installs spaceship-prompt into the DevContainer user's home directory.

# Exit script on any error
set -e

# Install ZSH
echo "Installing dependencies..."
apt-get update
apt-get install -y zsh git

# Prepare variables
_REMOTE_USER=${_REMOTE_USER:-"root"}
_REMOTE_USER_HOME=$(eval echo "~${_REMOTE_USER}")

# Install spaceship-prompt
su - "$_REMOTE_USER" -c "mkdir -p ${_REMOTE_USER_HOME}/.zsh"
su - "$_REMOTE_USER" -c "git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git ${_REMOTE_USER_HOME}/.zsh/spaceship"
su - "$_REMOTE_USER" -c "echo 'source \"${_REMOTE_USER_HOME}/.zsh/spaceship/spaceship.zsh\"' >> \"${_REMOTE_USER_HOME}/.zshrc\""