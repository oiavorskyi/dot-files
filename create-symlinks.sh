#!/bin/bash

dotfiles_dir=$(dirname "$(greadlink -f "$0" || readlink -f "$0")")

function link_config() {
	local source_dir=$1
	local dest_dir=$2
	ln -sfn "${dotfiles_dir}/${source_dir}" "${HOME}/${dest_dir}"
}

link_config "LaunchBar/Actions" "Library/Application Support/LaunchBar"
