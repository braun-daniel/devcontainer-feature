#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for spaceship" grep -q 'spaceship-prompt' ~/.zshrc

# Report result
reportResults