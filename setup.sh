#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable by all users including the root user
base=(

)

# folders that should, or only need to be installed for a local user
useronly=(
    git
    vim
    zsh
    dot-config
)

# run the stow command for the passed in directory ($2) in location $1

stowit() {
    usr=$1
    app=$2

    # -n no / simulate action
    # -v verbose
    # -R recursive
    # -t target

    dotFilePrefix="dot-"
    if [[ "$app" == "$dotFilePrefix"* ]]
    then
	usr="$usr""${app/"$dotFilePrefix"//.}"
    fi
    echo "***"
    echo "Target directory: ""$usr"
    echo "Source directory: ""$app"

    stow --adopt -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps available to local users and root
for app in ${base[@]}; do
    stowit "${HOME}" $app
done

echo "${HOME}"
# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$(whoami)" = *"root"* ]]
    then
        stowit "${HOME}" $app
    fi
done

echo ""
echo "##### ALL DONE"
