function new_cookbook --description 'Create new Pivotal cookbook from the template'
    set cookbook_name $argv[1]
    set cookbook_repo $argv[2]

    echo "Cloning template repo into directory $cookbook_name"
    git clone git@github.com:pivotalservices/modernization-cookbook-template.git --recursive $cookbook_name

    pushd $cookbook_name
        git remote remove origin
        git remote add origin $cookbook_repo
        git checkout --orphan cookbook
        git add -A
        git commit -m "Initial Commit"
        git branch -D master
        git branch -m master
        git push -f --set-upstream origin master
        git gc --aggressive --prune=all
    popd

    echo "The cookbook $cookbook_name was created and pushed to remote repo $cookbook_repo"
    echo "Update README and clean up existing content as needed"
end
