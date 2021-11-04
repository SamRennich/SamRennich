#!/bin/bash

# Check every repository for status

# Key
# P = Unpushed Changes
# M = Uncommitted or Unstaged Changes

# Text Colors
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # Check for unpushed, uncommitted, or unstaged changes
  if [ -n "$(git cherry)" ] || [ -n "$(git status --porcelain)" ]; then

    # If there are unpushed changes...
    if [ -n "$(git cherry)" ]; then printf "${CYAN}P${NORMAL}"; else printf " "; fi

    # If there are uncommitted or unstaged changes...
    if [ -n "$(git status --porcelain)" ]; then printf "${RED}M${NORMAL}"; else printf " "; fi

    # Print dir name and git status -s
    printf " %-20s|\n" $d
    printf "%s\n" "------------------------"
    git status -s
  fi

  cd .. # Move back
done
