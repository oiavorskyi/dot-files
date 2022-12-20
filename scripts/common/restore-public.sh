#!/usr/bin/env bash

source $MY_DIR/scripts/helpers/create-link.sh

# use custom mackup app definitions if they exist
if [[ -d $MY_DIR/mackup/.mackup ]]; then
    echo "Setting up custom mackup configuration"
    create_link mackup/.mackup .mackup
else
    echo "No custom mackup configuration found at ./mackup/.mackup. Skipping"
fi

# use public mackup configuration
echo "Preparing to restoring public configuration"
create_link mackup/.mackup.backup.public.cfg .mackup.cfg

# restore with public configuration
echo "Restoring public configuration"
mackup --verbose --force restore

# remove linking to avoid issues in the future
mackup --verbose --force uninstall

echo "Reconfiguring tools after restoration"
# install tmux plugins (taken from https://github.com/tmux-plugins/tpm/issues/6)
TPM_HOME=$HOME/.config/tmux/plugins/tpm
[ ! -d $TPM_HOME ] && git clone https://github.com/tmux-plugins/tpm $TPM_HOME 
tmux start-server
tmux new-session -d
$TPM_HOME/bin/install_plugins
tmux kill-server

# At this point it is better to start new iTerm session before continuing
echo 'The public configuration is restored. It is recommended to restart iTerm now'
