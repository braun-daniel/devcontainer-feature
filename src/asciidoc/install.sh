#!/usr/bin/env bash
# This script installs AsciiDoc and all necessary tools for a DevContainer feature.

# Exit script on any error
set -e

# Default version for AsciiDoctor (if not specified)
ASCIIDOCTOR_VERSION="${ASCIIDOCTOR_VERSION:-latest}"

# Default version for AsciiDoctor PDF (if not specified)
ASCIIDOCTOR_PDF_VERSION="${ASCIIDOCTOR_PDF_VERSION:-latest}"

# Default version for AsciiDoctor Diagram (if not specified)
ASCIIDOCTOR_DIAGRAM_VERSION="${ASCIIDOCTOR_DIAGRAM_VERSION:-latest}"

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

# Function to install AsciiDoctor Diagram (optional faster alternative)
install_asciidoctor_diagram() {
    if [ "$ASCIIDOCTOR_DIAGRAM_VERSION" = "latest" ]; then
        echo "Installing the latest version of AsciiDoctor Diagram via RubyGems..."
        gem install asciidoctor-diagram
    else
        echo "Installing AsciiDoctor Diagram (version $ASCIIDOCTOR_DIAGRAM_VERSION) via RubyGems..."
        gem install asciidoctor-diagram -v "$ASCIIDOCTOR_DIAGRAM_VERSION"
    fi
}

# Main installation process
install_asciidoctor
install_asciidoctor_pdf
install_asciidoctor_diagram
cleanup

# Verification of the installations
echo "Verifying installation..."
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

echo "AsciiDoc, AsciiDoctor and AsciiDoctor PDF installed successfully."