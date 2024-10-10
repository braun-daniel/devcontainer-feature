#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for fzf" sudo -u "$_REMOTE_USER" fzf --version

# Depending on the shell (bash, zsh, fish), check if the config was added to the profiles
if [ -n "$BASH_VERSION" ]; then
    check "check for fzf key bindings and fuzzy completion for bash" grep -q 'eval "$(fzf --bash)"' "${_REMOTE_USER_HOME}/.bashrc"
fi

if [ -n "$ZSH_VERSION" ]; then
    check "check for fzf key bindings and fuzzy completion for zsh" grep -q 'source <(fzf --zsh)' "${_REMOTE_USER_HOME}/.zshrc"
fi

if [ -n "$FISH_VERSION" ]; then
    check "check for fzf key bindings for fish" grep -q 'fzf --fish | source' "${_REMOTE_USER_HOME}/.config/fish/config.fish"
fi

# Report result
reportResults