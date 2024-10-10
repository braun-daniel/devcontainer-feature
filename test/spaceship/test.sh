#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for spaceship" echo $PROMPT | grep "spaceship"

# Report result
reportResults