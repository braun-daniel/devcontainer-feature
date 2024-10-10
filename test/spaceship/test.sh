#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for spaceship" sudo -u "$_REMOTE_USER" spaceship --version

# Report result
reportResults