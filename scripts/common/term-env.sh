#!/usr/bin/env bash
# Tools installed in this script are supposed to create a cohesive experience in
# the terminal. Development tools are not installed unless they are prerequisite
# for some fish/vim/tmux plugin 

echo
echo "Install and configure basic terminal experience"

if [ "$SHELL" != "$HOMEBREW_PREFIX/bin/fish" ]; then
  echo 'Current shell is not Fish. Start new terminal session and restart script'
	exit 1
fi

# CLI utilities
brew_install coreutils # GNU core utilities
brew_install grc # colorize things
brew_install fd # faster and more colorful alternative to find
brew_install bat # smarter cat with syntax highlighting
brew_install fzf # fuzzy search

echo

# Installing iTerm2
brew_install iterm2 --cask

# Installing terminal fonts
brew tap homebrew/cask-fonts
brew_install font-jetbrains-mono-nerd-font
brew_install font-fira-mono-nerd-font
brew_install font-meslo-lg-nerd-font

# Installing Tmux
brew_install tmux

# Installing Vim
brew_install vim

# Installing Git
brew_install git
brew_install git-delta

# Installing mackup to manage backup and restore of configuration
brew install mackup
