# Required to make GPG signatures work
set -x GPG_TTY (tty)
set -gx PATH $HOME/.cargo/bin $PATH
java11 &> /dev/null
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your ~/.config/fish/config.fish:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"

abbr k kubectl
abbr kg kubectl get
abbr kga kubectl get all
abbr kgp kubectl get pods
abbr kaf kubectl apply -f

abbr mk minikube kubectl
abbr mkg minikube kubectl get
abbr mkga minikube kubectl get all
abbr mkgp minikube kubectl get pods
abbr mkaf minikube kubectl apply -f
