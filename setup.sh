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

# next steps
# at this stage the machine is empty
# install common CLI tools

# Install everything else
#source ${MY_DIR}/scripts/common/editors.sh
#source ${MY_DIR}/scripts/common/git.sh
#source ${MY_DIR}/scripts/common/git-aliases.sh
#source ${MY_DIR}/scripts/common/applications-common.sh
#source ${MY_DIR}/scripts/common/developer-utilities.sh
#source ${MY_DIR}/scripts/common/unix.sh
#source ${MY_DIR}/scripts/common/configuration-osx.sh

source ${MY_DIR}/scripts/common/finished.sh
