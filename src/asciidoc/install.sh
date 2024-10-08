#!/usr/bin/env bash
# This script installs AsciiDoc and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Default version for AsciiDoctor (if not specified)
ASCIIDOCTOR_VERSION="${ASCIIDOCTOR_VERSION:-latest}"

# Default version for AsciiDoctor PDF (if not specified)
ASCIIDOCTOR_PDF_VERSION="${ASCIIDOCTOR_PDF_VERSION:-latest}"

# Function to install system dependencies
install_dependencies() {
    echo "Updating package lists..."
    apt-get update -y

    echo "Installing essential dependencies: Python, Git, Make, Docbook XML, and Docbook XSL..."
    apt-get install -y \
        python3 \
        python3-pip \
        git \
        make \
        docbook \
        docbook-xsl \
        xsltproc \
        ruby \
        asciidoc
}

# Function to install AsciiDoctor (optional faster alternative)
install_asciidoctor() {
    if [ "$ASCIIDOCTOR_VERSION" = "latest" ]; then
        echo "Installing the latest version of AsciiDoctor via RubyGems..."
        gem install asciidoctor
    else
        echo "Installing AsciiDoctor (version $ASCIIDOCTOR_VERSION) via RubyGems..."
        gem install asciidoctor -v "$ASCIIDOCTOR_VERSION"
    fi
}

# Function to install AsciiDoctor PDF (optional faster alternative)
install_asciidoctor_pdf() {
    if [ "$ASCIIDOCTOR_PDF_VERSION" = "latest" ]; then
        echo "Installing the latest version of AsciiDoctor PDF via RubyGems..."
        gem install asciidoctor-pdf
    else
        echo "Installing AsciiDoctor PDF (version $ASCIIDOCTOR_PDF_VERSION) via RubyGems..."
        gem install asciidoctor-pdf -v "$ASCIIDOCTOR_PDF_VERSION"
    fi
}

# Function to clean up after installation
cleanup() {
    echo "Cleaning up unnecessary packages and cache..."
    apt-get autoremove -y
    apt-get clean
    rm -rf /var/lib/apt/lists/*
}

# Main installation process
install_dependencies
install_asciidoctor
install_asciidoctor_pdf
cleanup

# Verification of the installations
echo "Verifying installation of AsciiDoc and AsciiDoctor..."
if command -v asciidoc >/dev/null 2>&1; then
    echo "AsciiDoc installed successfully."
else
    echo "Error: AsciiDoc installation failed." >&2
    exit 1
fi

if command -v asciidoctor >/dev/null 2>&1; then
    echo "AsciiDoctor installed successfully."
else
    echo "Error: AsciiDoctor installation failed." >&2
    exit 1
fi

if command -v asciidoctor-pdf >/dev/null 2>&1; then
    echo "AsciiDoctor PDF installed successfully."
else
    echo "Error: AsciiDoctor PDF installation failed." >&2
    exit 1
fi

echo "AsciiDoc and AsciiDoctor and AsciiDoctor PDF installed successfully."