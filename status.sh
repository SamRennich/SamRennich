#!/bin/bash

# Check every repository for status

# Key
# P = Unpushed Changes
# M = Uncommitted or Unstaged Changes

# Text Colors
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
CYAN=$(tput setaf 6)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # If there are unpushed changes...
  if [ -n "$(git cherry)" ]; then STATUS+="${CYAN}P${NORMAL}"; fi

  # If there are uncommitted or unstaged changes...
  if [ -n "$(git status --porcelain)" ]; then STATUS+="${RED}M${NORMAL}"; fi

  # Print dir name and git status -s
  if [ -n "${STATUS}" ]; then printf "%-2s %s\n" "${STATUS}" "${d}"; fi

  cd .. # Move back
done
