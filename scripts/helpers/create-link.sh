#!/usr/bin/env bash

# links file or directory using link_config source link
# source is relative to the setup.sh directory
# link is relative to $HOME directory
function create_link() {
	local src="${MY_DIR}/$1"
	local link="${HOME}/$2"
	[ -e "${link}" ] && [ ! -L "${link}" ] && mv -vf "${link}" "${link}.orig"
	ln -sfFnv "${src}" "${link}"
}
