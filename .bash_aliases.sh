#!/bin/sh
#
# Utility functions package updates and git checks

# Text Colors
readonly NO_COLOR=$(tput sgr0)
readonly BLACK=$(tput setaf 0)
readonly RED=$(tput setaf 1)
readonly GREEN=$(tput setaf 2)
readonly YELLOW=$(tput setaf 3)
readonly BLUE=$(tput setaf 4)
readonly MAGENTA=$(tput setaf 5)
readonly CYAN=$(tput setaf 6)
readonly WHITE=$(tput setaf 7)

# All good phrase
readonly ALL_GOOD="OK"

# Update, upgrade, and autoremove (uua = update, upgrade, autoremove)
uua() {
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove
}

# Check every repository for its status (rc = repo check)
rc() {

    # Key
    # U = Unupdated
    # P = Unpushed Changes
    # C = Uncommitted Changes
    # S = Unstaged Changes
    # T = Untracked Changes

    local ORIGINAL_DIR="$( pwd )"
    cd

    local OVERALL_STATUS=""

    for d in */; do
        cd $d

        local STATUS=""

        # Unupdated
        if [ "$( git remote show origin | grep 'local out of date' )" ]; then
            STATUS="${STATUS}${BLUE}U${NO_COLOR}"
        else
            STATUS="${STATUS} "
        fi

        # Unpushed
        if [ "$( git status | fgrep 'push' )" ]; then
            STATUS="${STATUS}${CYAN}P${NO_COLOR}"
        else
            STATUS="${STATUS} "
        fi

        # Uncommitted
        if [ "$( git status | fgrep 'to be committed' )" ] ; then
            STATUS="${STATUS}${YELLOW}C${NO_COLOR}"
        else
            STATUS="${STATUS} "
        fi

        # Unstaged
        if [ "$( git status | fgrep 'not staged' )" ]; then
            STATUS="${STATUS}${RED}S${NO_COLOR}"
        else
            STATUS="${STATUS} "
        fi

        # Untracked
        if [ "$( git status | fgrep 'Untracked' )" ]; then
            STATUS="${STATUS}${MAGENTA}T${NO_COLOR}"
        else
            STATUS="${STATUS} "
        fi

        if [ "${STATUS}" != "     " ]; then
            OVERALL_STATUS="${OVERALL_STATUS}${STATUS} ${d%?}\n"
        fi

        cd ..
    done

    if [ "${OVERALL_STATUS}" ]; then
        echo -n -e "${OVERALL_STATUS}"
    else
        echo "${ALL_GOOD}"
    fi

    cd $ORIGINAL_DIR
}
