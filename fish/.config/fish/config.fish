# Required to make GPG signatures work
set -x GPG_TTY (tty)
set -gx PATH $HOME/.cargo/bin $PATH
java8
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
