#!/bin/bash

# Check every repository for status

# Key
# P = Unpushed Changes
# C = Uncommitted Changes
# S = Unstaged Changes
# T = Untracked Changes

# Text Colors
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
MAGENTA=$(tput setaf 5)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # Store status flags
  STATUS=""

  # If there are unpushed changes...
  if [ -n "$( git status | fgrep 'push' )" ]; then STATUS+="${GREEN}P${NORMAL}"; fi

  # If there are uncommitted changes...
  if [ -n "$( git status | fgrep 'to be committed' )" ]; then STATUS+="${YELLOW}C${NORMAL}"; fi

  # If there are unstaged changes...
  if [ -n "$( git status | fgrep 'not staged' )" ]; then STATUS+="${RED}S${NORMAL}"; fi

  # If there are untracked changes...
  if [ -n "$( git status | fgrep 'Untracked' )" ]; then STATUS+="${MAGENTA}T${NORMAL}"; fi

  # Print dir name and git status -s
  if [ -n "${STATUS}" ]; then printf "%-3s %s\n" $STATUS $d; fi

  cd .. # Move back
done
