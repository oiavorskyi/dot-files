#!/bin/bash

which greadlink 2>&1 > /dev/null || (echo "Cannot found greadlink utility. Install with brew install coreutils"; exit 1)

dotfiles_dir=$(dirname "$(greadlink -f "$0" || readlink -f "$0")")

function link_config() {
	local source_dir="${dotfiles_dir}$1"
	local dest_dir="${HOME}$2"
	[ -e "${dest_dir}" ] && [ ! -L "${dest_dir}" ] && mv -vf "${dest_dir}" "${dest_dir}.orig"
	ln -sfFnv "${source_dir}" "${dest_dir}"
}

# Setup Launchbar
link_config "/LaunchBar/Actions" "/Library/Application Support/LaunchBar/Actions"
link_config "/LaunchBar/Configuration.plist" "/Library/Application Support/LaunchBar/Configuration.plist"

# Setup Git configuration
link_config "/git/.gitconfig" "/.gitconfig"
git config --global --replace-all core.hooksPath "${dotfiles_dir}/git/git-hooks-core"
git config --global --replace-all commit.template "${dotfiles_dir}/git/.gitmessage"

link_config "/httpie/.httpie" "/.httpie"

# Setup Tmux
link_config "/tmux/.tmux.conf" "/.tmux.conf"
[ ! -d ${HOME}/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
${HOME}/.tmux/plugins/tpm/bin/install_plugins

# Setup Fish
link_config "/fish/.config/fish/functions" "/.config/fish/functions"
link_config "/fish/.config/fish/completions" "/.config/fish/completions"
link_config "/fish/.config/fish/config.fish" "/.config/fish/config.fish"

# Setup Vim
link_config "/vim/.vimrc" "/.vimrc"
link_config "/vim/.vim" "/.vim"

link_config "/intellij-idea/.ideavimrc" "/.ideavimrc"

# Setup iTerm
link_config "/iTerm2/com.googlecode.iterm2.plist" "/Library/Preferences/com.googlecode.iterm2.plist"
