#!/usr/bin/env bash
# This script installs Mac OS apps available as casks

echo
echo "Installing Mac apps available in Brew"

brew_install 1password --cask          # Password manager of choice
brew_install 1password-cli --cask      # Command-line helper for 1Password
brew_install launchbar --cask          # Productivity tool to launch apps and more
brew_install jetbrains-toolbox --cask  # JetBrains tools manager
brew_install visual-studio-code --cask # Open-source code editor nice for k8s and web dev
brew_install textexpander --cask       # Keyboard abbreviation manager
