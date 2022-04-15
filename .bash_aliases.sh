#!/bin/bash

# Text Colors
NORMAL=$(tput sgr0)
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

function uu {
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove
}

# Check every repository for status
function status() {

    # Key
    # P = Unpushed Changes
    # C = Uncommitted Changes
    # S = Unstaged Changes
    # T = Untracked Changes

    # For every dir...
    for d in */; do
        cd $d # Move to dir

        # Store status flags
        STATUS=""

        # If there are unpushed changes...
        if [ -n "$( git status | fgrep 'push' )" ]; then
            STATUS+="${CYAN}P${NORMAL}"
        fi

        # If there are uncommitted changes...
        if [ -n "$( git status | fgrep 'to be committed' )" ]; then
            STATUS+="${YELLOW}C${NORMAL}"
        fi

        # If there are unstaged changes...
        if [ -n "$( git status | fgrep 'not staged' )" ]; then
            STATUS+="${RED}S${NORMAL}"
        fi

        # If there are untracked changes...
        if [ -n "$( git status | fgrep 'Untracked' )" ]; then
            STATUS+="${MAGENTA}T${NORMAL}"
        fi

        # Print dir name and git status -s
        if [ -n "${STATUS}" ]; then
            printf "%-3s %s\n" $STATUS $d
        fi

        cd .. # Move back
    done
}

# Check for updates from origin for every repository
function update() {

    # Key
    # U = Updates are Available

    # For every dir...
    for d in */; do
        cd $d # Move to dir

        # If out of date...
        if [ -n "$(git remote show origin | grep 'local out of date')" ]; then
            printf "%s %s\n" "${RED}U${NORMAL}" $d;
        fi

        cd .. # Move back
    done
}

# Check for status and updates and if there are none, exit
function check() {

    # Store output from check functions
    STATUS="$(status)"
    UPDATE="$(update)"

    # Checking scheme
    if [ -n "${STATUS}" ]; then # If status returns something...
        printf "${STATUS}"
        if [ -n "${UPDATE}" ]; then # If UPDATE returns something...
            printf "\n"
            printf "${UPDATE}"
        fi
    elif [ -n "${UPDATE}" ]; then # If UPDATE returns something...
        printf "${UPDATE}"
    else # Exit shell
        printf "OK"
    fi

    printf "\n"
}
