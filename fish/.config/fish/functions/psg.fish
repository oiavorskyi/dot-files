function psg --description 'Bit smarter search for a process'
	ps aux | grep -v grep | grep -i -e VSZ -e $argv;
end
