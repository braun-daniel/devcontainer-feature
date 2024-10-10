#!/usr/bin/env bash

set -e

# Install dependencies
echo "Installing git and wget..."
apt-get update
apt-get install -y git wget

# # Install Go
# echo "Installing Go..."
# GO_VERSION="1.20.5"
# wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
# tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin

# Install fzf as the remote user
_REMOTE_USER=${_REMOTE_USER:-"root"}
_REMOTE_USER_HOME=$(eval echo "~${_REMOTE_USER}")

su - "$_REMOTE_USER" -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${_REMOTE_USER_HOME}/.fzf"
su - "$_REMOTE_USER" -c "${_REMOTE_USER_HOME}/.fzf/install --all"