function git-fetch-latest-only -a url target
    git clone --depth=1 --branch=master $url $target 
    if test -d $target
        rm -rf $target/.git
    end
end
