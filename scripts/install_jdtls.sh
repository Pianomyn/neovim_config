#!/bin/bash

# Variables
JDTLS_VERSION="latest"
JDTLS_URL="http://download.eclipse.org/jdtls/snapshots/jdt-language-server-${JDTLS_VERSION}.tar.gz"
INSTALL_DIR="/opt/jdtls"
TMP_DIR="/tmp/jdtls_download"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (using sudo)"
    exit 1
fi

# Create a temporary directory for downloading JDTLS
echo "Creating temporary directory: $TMP_DIR"
mkdir -p "$TMP_DIR"

# Download the latest JDTLS
echo "Downloading JDTLS from $JDTLS_URL..."
wget -O "$TMP_DIR/jdtls.tar.gz" "$JDTLS_URL"

# Extract JDTLS
echo "Extracting JDTLS..."
mkdir -p "$INSTALL_DIR"
tar -xvzf "$TMP_DIR/jdtls.tar.gz" -C "$INSTALL_DIR"

# Clean up
echo "Cleaning up..."
rm -rf "$TMP_DIR"

# Set permissions
echo "Setting permissions for $INSTALL_DIR..."
sudo chown -R root "$INSTALL_DIR"
chmod -R 755 "$INSTALL_DIR"

# Done
echo "JDTLS installed successfully in $INSTALL_DIR."
echo "You can now configure your IDE or editor to use $INSTALL_DIR/bin/jdtls."

exit 0

