#!/bin/bash

# Check every repository for status

# Text Colors
NC=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # Checking scheme
  if [ -n "$(git cherry)" ]; then # If there are unpushed changes...
    printf "%-20s %s\n" $d "${CYAN}Unpushed Changes${NC}"
  elif [ -n "$(git status --porcelain)" ]; then # If there are unstaged changes...
    printf "%-20s %s\n" $d "${RED}Unstaged Changes${NC}"
  elif ! git diff --quiet; then # If there are uncommitted changes...
    printf "%-20s %s\n" $d "${YELLOW}Uncommitted Changes${NC}"
  else # If there are no changes...
    printf "%-20s %s\n" $d "${GREEN}No Changes${NC}"
  fi

  cd .. # Move back
done
