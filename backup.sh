#!/usr/bin/env bash

which greadlink 2>&1 > /dev/null || (echo "Cannot found greadlink utility. Install with brew install coreutils"; exit 1)

workspace_setup_dir=$(dirname "$(greadlink -f "$0" || readlink -f "$0")")

# links file or directory using link_config source link
# source is relative to this script directory
# link is relative to $HOME directory
function link_config() {
	local src="${workspace_setup_dir}/$1"
	local link="${HOME}/$2"
	[ -e "${link}" ] && [ ! -L "${link}" ] && mv -vf "${link}" "${link}.orig"
	ln -sfFnv "${src}" "${link}"
}

# use custom mackup app definitions if they exist
if [[ -d $workspace_setup_dir/mackup/.mackup ]]; then
    echo "Setting up custom mackup configuration"
    link_config mackup/.mackup .mackup
else
    echo "No custom mackup configuration found at ./mackup/.mackup. Skipping"
fi

# use public mackup configuration
echo "Preparing to backup public configuration"
link_config mackup/.mackup.backup.public.cfg .mackup.cfg

# perform the backup of public configuration
echo "Backing up public configuration"
mackup --verbose --force backup

# putting public files back to avoid linking issues
mackup --verbose --force uninstall

# use sensitive mackup configuration
echo "Preparing to backup sensitive configuration"
link_config mackup/.mackup.backup.sensitive.cfg .mackup.cfg

# perform the backup of sensitive configuration
echo "Backing up sensitive configuration"
mackup --verbose --force backup

# putting sensitive files back to avoid linking issues
mackup --verbose --force uninstall

# archive sensitive settings to simplify transfer
echo "Packing sensitive configuration to sensitive-preferences-backup.tgz"
tar -czf sensitive-preferences-backup.tgz sensitive && rm -rf sensitive
