#!/usr/bin/env bash
# Rather crappy and overly complex submodule update script.
# Won't automagically add them to the index, but will show pretty changes.
# Written primarily to manage my vim plugins through pathogen.
#
# (c) Alexandre Gauthier 2010-2011, All rights reserved
# Released under the MIT License.

GIT=$(which git)

echo "Vim pathogen git submodule update script"
echo "Alexandre Gauthier 2010-2011"
echo "https://github.com/mrdaemon/vimconfigs"
echo -n -e "\n"

[[ -z $GIT ]] && { "Woops, can't find git on this machine, bye." ; exit 1 ; }

echo "Pre-flight sanity checks..."
if [[ -n $($GIT submodule status | egrep "^-") ]] ; then
    echo "WARNING: Some submodules apparently need to be initialized."
    echo "Correcting..."
    { $GIT submodule init && $GIT submodule update ; } || exit 1
    echo "Modules initialized."
fi
echo "Everything's good. Checking for plugin updates..."

if $GIT submodule -q foreach "$GIT checkout -q master && $GIT pull -q" ; then
    UC=$($GIT submodule status | grep "+" | wc -l | xargs)

    if [[ $UC -gt 0 ]] ; then
        echo -n -e "\n"
        echo "******************** $UC MODULE(S) UPDATED! ********************"
        echo -e "Changes:\n"
        $GIT submodule summary
        echo "Don't forget to 'git add' the submodules you wish to keep."
    else
        echo "No new submodule commits."
    fi

    echo "Done."
    exit 0
else
    echo "Oh god, that went awry. Please fix it :("
    exit 1
fi

