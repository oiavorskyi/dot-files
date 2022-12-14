function fetch_github_release --description 'Downloads latest binary release from GitHub for specific platform'
    set latest_release_url https://api.github.com/repos/$argv[1]/releases/latest 
    set platform_qualifier $argv[2]
    set fetch_url (curl -s $latest_release_url | grep browser_download_url | grep $platform_qualifier | cut -d '"' -f 4)

    echo Fetching the latest version of $argv[1] from $fetch_url
    wget $fetch_url
end

