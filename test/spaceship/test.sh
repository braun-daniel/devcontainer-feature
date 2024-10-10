#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for spaceship" su -c "$_REMOTE_USER" -c "spaceship --version"

# Report result
reportResults