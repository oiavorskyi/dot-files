function ls --wraps='grc --colour=auto ls --color=always' --description 'alias ls=grc --colour=auto ls --color=always'
  grc --colour=auto ls --color=always $argv; 
end
