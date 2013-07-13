#!/usr/bin/env bash
# Disgusting script to remove a git submodule cleanly, because it is a pain.
# Originally written in 10 minutes at 5am while sleep deprived
# 
# Surely, it must be reliable, right?
#
# (c) Alexandre Gauthier 2010-2011, All rights reserved
# Released under the MIT License.

GIT=$(which git)

if [[ ! -n "$1" ]] ; then
    echo "Remove a git submodule by path."
    echo "Usage: $(basename $0) [relative path]"
    exit 1
fi

if [[ -z $GIT ]] ; then
    echo "Woops, can't find git on this machine, bye."
    exit 1
fi

# I'd rather just fail cleanly than actually implement this.
if [[ ! -d ".git" ]] ; then
    echo "You MUST run this at the top level directory of your master repos."
    exit 1
fi

if [[ ! -f ".gitmodules" ]] ; then
    echo "Look you need submodules to want to remove a submodule. Geez."
    exit 1
fi

if [[ ! -d "$1" ]] ; then
    echo "$1 not found or is not a directory."
    exit 1
fi

# Do the deed
SM=$1
C=$(grep "path =" .gitmodules | grep -e "$SM\$" | awk '{print $3;}')

if [[ "$C" == "$SM" ]] ; then
    echo -n "Removing submodule $SM... "
    $GIT config -f .gitmodules --remove-section submodule.$SM || \
        { echo -e "\nFailed to remove from .gitmodules, sorry." ; exit 1 ; }
    
    $GIT config -f .git/config --remove-section submodule.$SM || \
        { echo -e "\nFailed to remove from .git/config, sorry." ; exit 1 ; }

    $GIT add .gitmodules
    $GIT rm -f $SM > /dev/null

    if [[ $? -ne 0 ]] ; then
        echo -e "\nStaging removal of $SM failed." 
        echo "You probably want to inspect the situation and reset HEAD"
        exit 1
    fi

    echo "done."

    echo "Please review and commit changes."
    echo "Have a great $(basename $SM)-free day."
else
    echo "$SM is not a currently registered submodule."
    exit 1
fi
