#!/usr/bin/env bash
#
# setup.sh:  run the workstation setup

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"
export HOMEBREW_NO_ANALYTICS=1

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh
source ${MY_DIR}/scripts/helpers/brew-install.sh

# Install and configure Fish shell for current user
# Note: to continue setup new terminal session will be required
source ${MY_DIR}/scripts/common/fish.sh

# configure basic terminal environment
source ${MY_DIR}/scripts/common/term-env.sh

# Install everything else
#source ${MY_DIR}/scripts/common/editors.sh
#source ${MY_DIR}/scripts/common/git.sh
#source ${MY_DIR}/scripts/common/git-aliases.sh
#source ${MY_DIR}/scripts/common/applications-common.sh
#source ${MY_DIR}/scripts/common/developer-utilities.sh
#source ${MY_DIR}/scripts/common/unix.sh
#source ${MY_DIR}/scripts/common/configuration-osx.sh

source ${MY_DIR}/scripts/common/finished.sh
