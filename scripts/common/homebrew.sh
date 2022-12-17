echo

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if which brew; then
      echo "Homebrew install verified"
  else
      echo "Updating PATH in zsh to include Homebrew binaries"
			echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
    	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    	eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Ensuring your Homebrew directory is writable..."
sudo chown -Rf $(whoami) $(brew --prefix)/*

echo
echo "Installing Homebrew services..."
brew tap homebrew/services

echo
echo "Cleaning up your Homebrew installation..."
brew cleanup
