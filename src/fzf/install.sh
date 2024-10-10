#!/usr/bin/env bash

set -e

# Install dependencies
echo "Installing git..."
apt-get update
apt-get install -y git wget

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all