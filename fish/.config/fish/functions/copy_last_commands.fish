function copy_last_commands --description 'Copies last 10 commands from history to clipboard in a same order they were entered'
    history | head | tac | pbcopy 
end
