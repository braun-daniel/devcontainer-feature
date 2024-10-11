#!/usr/bin/env bash

set -e

# Install dependencies
echo "Installing git and wget..."
apt-get update
apt-get install -y git wget

# Prepare variables
_REMOTE_USER=${_REMOTE_USER:-"root"}
_REMOTE_USER_HOME=$(eval echo "~${_REMOTE_USER}")

# Install fzf
su - "$_REMOTE_USER" -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${_REMOTE_USER_HOME}/.fzf"
su - "$_REMOTE_USER" -c "${_REMOTE_USER_HOME}/.fzf/install --all"