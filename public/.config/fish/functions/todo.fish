function todo -a task --description 'Adds new task to ~/.TODO file'
    if test -z "$task"
        echo 'Specify task to add. For example, todo "buy milk"'
        return
    end
    echo "[] $task" >> $HOME/.TODO
end
