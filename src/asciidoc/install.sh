#!/usr/bin/env bash
# This script installs AsciiDoctor and related tools for a DevContainer feature.

# Exit script on any error
set -e

# Update package lists and install Ruby
echo "Updating package lists and installing Ruby..."
apt-get update -y && apt-get install -y ruby

# Install RubyGems
echo "Installing AsciiDoctor and related gems..."
gem install asciidoctor asciidoctor-pdf asciidoctor-diagram asciidoctor-kroki

# Clean up unnecessary packages and cache
echo "Cleaning up unnecessary packages and cache..."
apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*