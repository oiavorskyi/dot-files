# Required to make GPG signatures work
set -x GPG_TTY (tty)
set -gx PATH $HOME/.cargo/bin $PATH
java11
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

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
