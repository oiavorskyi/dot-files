#!/usr/bin/env bash

# Install formula using brew unless it is already installed
# To install cask call it with parameters like this
#		brew_install <name> --cask
brew_install() {
    local formula=$1 && shift
    if brew list $formula &>/dev/null; then
        echo "${formula} is already installed"
    else
        brew install "$@" $formula && echo "$formula is installed"
    fi
}
