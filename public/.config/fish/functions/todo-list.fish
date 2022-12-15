function todo-list --description 'Shows all uncompleted tasks from ~/.TODO file'
    grep -n -v "\[x\]" $HOME/.TODO
end
