function pid --description 'Retrieve PID of the specific process' 
	ps -o pid= -o command= | grep -v grep | grep $argv[1] | awk '{print $1}';
end
