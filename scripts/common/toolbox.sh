#!/usr/bin/env bash
# This script installs dev tools and other goodies

echo
echo "Installing utilities for unix and development"

brew_install direnv              # load/unload environment variables based on $PWD
brew_install gnu-sed             # GNU implementation of the famous stream editor
brew_install htop                # Improved top (interactive process viewer)
brew_install ncdu                # NCurses Disk Usage
brew_install nmap                # Port scanning utility for large networks
brew_install peco                # Simplistic interactive filtering tool
brew_install ripgrep             # Search tool like grep and The Silver Searcher
brew_install httpie              # User-friendly cURL replacement (command-line HTTP client)
brew_install jq                  # Lightweight and flexible command-line JSON processor
brew_install lnav                # Curses-based tool for viewing and analyzing log files
brew_install the_silver_searcher # Code-search similar to ack
brew_install tig                 # Text interface for Git repositories
brew_install tree                # Display directories as trees (with optional color/HTMLjoutput)
brew_install watch               # Executes a program periodically, showing output fullscreen
brew_install wget                # Internet file retriever
brew_install exa                 # Modern replacement for 'ls'
brew_install gh                  # GitHub command-line tool
brew_install gnu-tar             # GNU version of the tar archiving utility
brew_install mkcert              # Simple tool to make locally trusted development certificates
brew_install pv                  # Monitor data's progress through a pipe
brew_install youtube-dl          # Download YouTube videos from the command-line
brew_install make                # Utility for directing compilation
brew_install shellcheck          # Static analysis and lint tool, for (ba)sh scripts

echo
echo "Installing Container/Cloud/K8s tools"
brew_install docker --cask # Pack, ship and run any application as a lightweight container
brew_install kubectl       # Kubernetes
brew_install kubectx       # Tool that can switch between kubectl contexts easily and create aliases
brew_install kustomize     # Template-free customization of Kubernetes YAML manifests
brew_install kind          # Run local Kubernetes cluster in Docker
brew_install k9s           # Kubernetes CLI To Manage Your Clusters In Style!
brew_install popeye        # A Kubernetes Cluster sanitizer and linter.
brew_install dive          # Tool for exploring each layer in a docker image
brew_install kubeseal      # Kubernetes controller and tool for one-way encrypted Secrets
brew_install yq            # Process YAML, JSON, XML, CSV and properties documents from the CLI
brew_install stern         # Tail multiple Kubernetes pods & their containers
brew tap farmotive/k8s
brew_install kpoof         # Quick k8s pod port-forward utility
brew tap vmware-tanzu/carvel
brew_install ytt           # Carvel YAML templating tool
brew_install kbld          # Carvel k8s image building tool
brew_install kapp          # Carvel k8s app management tool
brew_install imgpkg        # Carvel config bundling and relocation tool
brew_install vendir        # Carvel directory content management tool
brew_install awscli        # Official Amazon AWS command-line interface
brew tap aws/tap
brew_install aws-sam-cli   # AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications
brew_install azure-cli     # Microsoft Azure CLI 2.0

echo
echo "Installing Web Dev tools"
brew_install node   # NodeJS
brew_install eslint # AST-based pattern checker for JavaScript

# setting up checks for credentials in the git commits
if [ ! -f $HOME/.local/bin ]; then
    echo
    echo "Setting up cred-alert"

    # install cred-alert-cli
    os_name=$(uname | awk '{print tolower($1)}')
    curl -Ls -o cred-alert-cli \
      https://github.com/pivotal-cf/cred-alert/releases/latest/download/cred-alert-cli_${os_name}
    chmod 755 cred-alert-cli
    mkdir -p "$HOME/.local/bin"
    mv cred-alert-cli "$HOME/.local/bin"

    HOOKS_DIRECTORY=$HOME/.git-hooks-vmware
    if [ ! -d $HOOKS_DIRECTORY ]; then
        echo
        echo "Installing git hooks for cred-alert"
        # for more information see https://github.com/pivotal-cf/git-hooks-core
        git clone https://github.com/pivotal-cf/git-hooks-core $HOOKS_DIRECTORY
        git config --global --add core.hooksPath $HOOKS_DIRECTORY
    else
        echo
        echo "Updating git-hooks for cred-alert"
        pushd $HOOKS_DIRECTORY
        git pull -r
        popd
    fi
else
    echo "The cred-alert has been already setup"
fi
