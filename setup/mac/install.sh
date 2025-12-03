#!/bin/bash

# --- 1. macOS Build Dependencies and Utilities Installation ---

echo "Starting macOS development environment setup..."
echo "--- 1. Installing Homebrew packages ---"

# Update Homebrew
brew update

# Install all requested utilities and Python build dependencies
# Homebrew automatically handles linking libraries like libssl, zlib, etc.
brew install \
  rg \
  neovim \
  bat \
  ripgrep \
  node \
  lua \
  go \
  wget \
  llvm \
  tk \
  xz \
  libffi

# --- 2. Java (JDK 17) Installation ---

echo "--- 2. Installing OpenJDK 17 ---"

# Install OpenJDK 17
brew install openjdk@17

# Link OpenJDK (crucial for setting up the environment variable)
# Requires sudo permission
echo "Linking OpenJDK 17 (requires sudo)..."
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# --- 3. Python Version Management (pyenv) Setup ---

echo "--- 3. Setting up pyenv ---"

# Install pyenv using Homebrew
brew install pyenv

# Add pyenv initialization to the shell configuration file (~/.zshrc)
SHELL_CONFIG="$HOME/.zshrc"

echo '# --- pyenv setup start ---' >> "$SHELL_CONFIG"
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$SHELL_CONFIG"
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> "$SHELL_CONFIG"
echo 'eval "$(pyenv init -)"' >> "$SHELL_CONFIG"
echo '# --- pyenv setup end ---' >> "$SHELL_CONFIG"

# Note: The script needs to run in the current shell to activate pyenv immediately.
# We source the config file to load the pyenv functions for the next steps.
echo "Sourcing $SHELL_CONFIG to activate pyenv for this session..."
source "$SHELL_CONFIG"

# --- 4. Python Installation and Verification ---

echo "--- 4. Installing and setting Python 3.9.0 ---"

# Install Python 3.9.0
pyenv install 3.9.0

# Set Python 3.9.0 as the global default version
pyenv global 3.9.0

# Verify the version
echo "Current Python version set by pyenv:"
python --version

# --- 5. JDTLS Installation ---

echo "--- 5. Running JDTLS install script ---"

# Execute the install script
# This assumes the script path is relative to the directory where THIS setup script is run.
zsh ../../scripts/install_jdtls.sh

echo "--- Setup Complete! ---"
echo "Please restart your terminal session or run 'source ~/.zshrc' manually."
