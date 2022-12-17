#!/usr/bin/env bash
echo

# Setting up fish shell
if [ "$SHELL" != "$HOMEBREW_PREFIX/bin/fish" ]; then
	echo "Installing and configuring Fish shell"
  brew_install fish
  
  # enable fish shell
  sudo grep 'bin/fish' /etc/shells ||  sudo sh -c "echo ${HOMEBREW_PREFIX}/bin/fish >> /etc/shells"
  
  # set default shell for current user to fish
  chsh -s $HOMEBREW_PREFIX/bin/fish
  
  # download tool to integrate fish with brew correctly
  mkdir -p ~/.config/fish/conf.d
  curl -LJ0s https://raw.githubusercontent.com/halostatue/fish-brew/main/conf.d/halostatue_fish_brew.fish -o ~/.config/fish/conf.d/fish_brew_env.fish
  
  # populate brew env file to source by the tool
  mkdir -p ~/.config/brew
  grep "HOMEBREW_PREFIX" ~/.config/brew/config.fish > /dev/null 2>&1 ||\
  	echo "set -gx HOMEBREW_PREFIX $HOMEBREW_PREFIX" >> ~/.config/brew/config.fish
  grep "HOMEBREW_CELLAR" ~/.config/brew/config.fish ||\
  	echo "set -gx HOMEBREW_CELLAR $HOMEBREW_CELLAR" >> ~/.config/brew/config.fish
  grep "HOMEBREW_REPOSITORY" ~/.config/brew/config.fish ||\
  	echo "set -gx HOMEBREW_REPOSITORY $HOMEBREW_REPOSITORY" >> ~/.config/brew/config.fish
  grep "MANPATH" ~/.config/brew/config.fish ||\
  	echo "set -gx MANPATH $HOMEBREW_PREFIX/share/man:$MANPATH" >> ~/.config/brew/config.fish
  grep "INFOPATH" ~/.config/brew/config.fish ||\
  	echo "set -gx INFOPATH $HOMEBREW_PREFIX/share/info:$INFOPATH" >> ~/.config/brew/config.fish
else
  echo 'Fish shell already setup for the user, skipping'
fi
