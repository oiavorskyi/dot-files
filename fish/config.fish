###############################
### Configure Fish defaults ###
###############################

# Select preferred theme
fish_config theme choose Dracula

###################################
### Setup environment and tools ###
###################################

# Setup Go environment
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec
if test ! -d $GOROOT
    echo "Unable to find Go distribution at $GOROOT."
    echo "Update config.fish with the correct path to avoid calling brew to resolve it each time the configuration is sourced."
    set -x GOROOT (brew --prefix golang)/libexec
end
set fish_add_path $GOPATH/bin $GOROOT/bin

# Add my scripts to PATH
fish_add_path $HOME/.local/bin

# Required to make GPG signatures work
set -x GPG_TTY (tty)

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# This links Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"

# Enable integration between iTerm/Fish/Tmux as per 
# https://gitlab.com/gnachman/iterm2/-/wikis/tmux-Integration-Best-Practices
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

###############
### Aliases ###
###############

# For K8s
abbr k kubectl
abbr kg kubectl get
abbr kga kubectl get all
abbr kgp kubectl get pods
abbr kaf kubectl apply -f
