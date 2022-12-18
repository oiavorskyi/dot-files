#!/usr/bin/env bash
# This script installs Java development tools

echo
echo "Installing Java and JVM tools"

# SDKMAN!
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.352-amzn < /dev/null # For legacy development needs
sdk install java 11.0.17-tem < /dev/null  # Lot of clients still use this version
sdk install java 17.0.5-tem < /dev/null   # Current LTS
sdk install java 19.0.1-tem < /dev/null   # Bleeding edge, the latest available
sdk default java 17.0.5-tem

# build tools
sdk install gradle
sdk install maven
sdk install springboot
