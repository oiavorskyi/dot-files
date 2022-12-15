function todo-check -a task_num --description 'Marks task with <task_num> as complete in ~/.TODO file'
    if test -z "$task_num"
        echo 'Specify number of task to complete. For example, todo 3'
        return
    end
    sed -i'' -e "$task_num""s/\[\]/\[x\]/" $HOME/.TODO
end
