function update-all-things --description 'Updates apps and plugins installed with brew, fisher and tmux'
    echo "Updating apps installed with brew"
    brew update && brew upgrade --cask && brew upgrade && brew cleanup
    echo "Updating Fish plugins"
    fisher update
    if test -f $HOME/.config/tmux/plugins/tpm/bindings/update_plugins -a -n "$TMUX"
        echo "Updating tmux plugins"
        $HOME/.config/tmux/plugins/tpm/bindings/update_plugins 
    end
end
