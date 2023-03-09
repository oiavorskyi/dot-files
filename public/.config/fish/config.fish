###############################
### Configure Fish defaults ###
###############################

# Select preferred theme
fish_config theme choose Dracula

###################################
### Setup environment and tools ###
###################################

set -x EDITOR $HOMEBREW_PREFIX/bin/vim

set -x BAT_THEME Dracula

# Setup Go environment
set -x GOPATH $HOME/workspace/go
set -x GOROOT /opt/homebrew/opt/go/libexec
if test ! -d $GOROOT
    echo "Unable to find Go distribution at $GOROOT."
    echo "Update config.fish with the correct path to avoid calling brew to resolve it each time the configuration is sourced."
    set -x GOROOT (brew --prefix golang)/libexec
end
fish_add_path $GOPATH/bin $GOROOT/bin
set -x GOPRIVATE "*.vmware.com"

# Add my scripts to PATH
fish_add_path $HOME/.local/bin

# Add k8s plugin manager krew to PATH
fish_add_path $HOME/.krew/bin

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# This links Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"

# Add Postgres binaries to the path
fish_add_path $HOMEBREW_PREFIX/opt/libpq/bin
