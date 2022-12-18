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

function check_base_env_configured {
    [ -f $MY_DIR/.base-install.completed ]
}

function mark_base_env_configured {
    touch $MY_DIR/.base-install.completed
}

function configure_base_terminal_env {
    check_base_env_configured\
        && echo 'base environment configuration already completed'\
        && exit 1 

    # Note: Homebrew needs to be set up first
    source ${MY_DIR}/scripts/common/homebrew.sh
    source ${MY_DIR}/scripts/helpers/brew-install.sh
    
    # Install and configure Fish shell for current user
    # Note: to continue setup new terminal session will be required
    source ${MY_DIR}/scripts/common/fish.sh
    
    # configure basic terminal environment
    source ${MY_DIR}/scripts/common/term-env.sh
   
    mark_base_env_configured 
}
    
# Install everything else
#source ${MY_DIR}/scripts/common/editors.sh
#source ${MY_DIR}/scripts/common/git.sh
#source ${MY_DIR}/scripts/common/git-aliases.sh
#source ${MY_DIR}/scripts/common/applications-common.sh
#source ${MY_DIR}/scripts/common/developer-utilities.sh
#source ${MY_DIR}/scripts/common/unix.sh
#source ${MY_DIR}/scripts/common/configuration-osx.sh

#source ${MY_DIR}/scripts/common/finished.sh

# Without any parameters we should only install the minimal terminal environment
if [ $# -eq 0 ]; then
    configure_base_terminal_env
fi
