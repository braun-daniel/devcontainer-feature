#!/usr/bin/env bash
# This script installs fzf and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Determine the remote user (typically non-root, like vscode or devuser)
REMOTE_USER="${_REMOTE_USER:-root}"

# Clone the fzf repository into the remote user's home directory
echo "Cloning fzf repository..."
git clone --depth 1 https://github.com/junegunn/fzf.git "$REMOTE_USER_HOME/.fzf"

# Run the fzf install script
echo "Running fzf install script..."
"$REMOTE_USER_HOME/.fzf/install"

# Home directory of the remote user
USER_HOME="/home/${REMOTE_USER}"

# Set up fzf key bindings and fuzzy completion for bash
if [ -n "$BASH_VERSION" ]; then
    echo "Setting up fzf key bindings and fuzzy completion for bash..."
    echo 'eval "$(fzf --bash)"' >> "${USER_HOME}/.bashrc"
    chown "${REMOTE_USER}:${REMOTE_USER}" "${USER_HOME}/.bashrc"
fi

# Set up fzf key bindings and fuzzy completion for zsh
if [ -n "$ZSH_VERSION" ]; then
    echo "Setting up fzf key bindings and fuzzy completion for zsh..."
    echo 'source <(fzf --zsh)' >> "${USER_HOME}/.zshrc"
    chown "${REMOTE_USER}:${REMOTE_USER}" "${USER_HOME}/.zshrc"
fi

# Set up fzf key bindings for fish
if [ -n "$FISH_VERSION" ]; then
    echo "Setting up fzf key bindings for fish..."
    mkdir -p "${USER_HOME}/.config/fish"
    echo 'fzf --fish | source' >> "${USER_HOME}/.config/fish/config.fish"
    chown -R "${REMOTE_USER}:${REMOTE_USER}" "${USER_HOME}/.config/fish"
fi