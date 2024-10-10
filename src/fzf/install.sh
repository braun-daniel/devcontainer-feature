#!/usr/bin/env bash

set -e

# Install dependencies
echo "Installing git..."
apt-get update
apt-get install -y git wget

# Install fzf
su - "$_REMOTE_USER" -c "git clone --depth=1 https://github.com/junegunn/fzf.git ${_REMOTE_USER_HOME}/.fzf"
su - "$_REMOTE_USER" -c "${_REMOTE_USER_HOME}/.fzf/install"