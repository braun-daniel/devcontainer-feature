#!/usr/bin/env bash
# This script installs spaceship-prompt into the DevContainer user's home directory.

# Exit script on any error
set -e

# Check if zsh is installed
if ! command -v zsh > /dev/null; then
    echo "Zsh is not installed. Please install zsh before running this script."
    exit 1
fi

# Ensure the DevContainer user's home directory is used
DEVCONTAINER_HOME="${HOME}"

# Create the .zsh directory if it doesn't exist
mkdir -p "$DEVCONTAINER_HOME/.zsh"

# Clone the spaceship-prompt repository into the .zsh directory
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$DEVCONTAINER_HOME/.zsh/spaceship"

# Make sure the spaceship-prompt is permanently sourced in the .zshrc file
echo 'source "$DEVCONTAINER_HOME/.zsh/spaceship/spaceship.zsh"' >> "$DEVCONTAINER_HOME/.zshrc"