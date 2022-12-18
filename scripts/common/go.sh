#!/usr/bin/env bash
# This script installs and configures Go dev tools

echo
echo "Installing utilities for Go development"

brew_install go            # Open source programming language to build simple/reliable/efficient software
brew_install golangci-lint # Fast linters runner for Go

mkdir -p $HOME/go/{bin,src,pkg}

set GOPATH=$HOME/go
set GOROOT=$(brew --prefix golang)/libexec

go install golang.org/x/tools/cmd/goimports@latest # maintain import statements
go install golang.org/x/tools/cmd/godoc@latest     # generate and serve documentation
