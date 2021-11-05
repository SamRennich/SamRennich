#!/bin/bash

# Check every repository for status

# Key
# P = Unpushed Changes
# C = Uncommitted Changes
# S = Unstaged Changes

# Text Colors
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # Store status flags
  STATUS=""

  # If there are unpushed changes...
  if [ -n "$( git status | fgrep 'push' )" ]; then STATUS+="${CYAN}P${NORMAL}"; fi

  # If there are uncommitted changes...
  if [ -n "$( git status | fgrep 'committed' )" ]; then STATUS+="${GREEN}C${NORMAL}"; fi

  # If there are unstaged changes...
  if [ -n "$( git status | fgrep 'staged' )" ]; then STATUS+="${RED}S${NORMAL}"; fi

  # Print dir name and git status -s
  if [ -n "${STATUS}" ]; then printf "%-3s %s\n" $STATUS $d; fi

  cd .. # Move back
done
