#!/bin/bash

# Check every repository for status

# Key
# P = Unpushed Changes
# C = Uncommitted Changes
# S = Unstaged Changes

# Text Colors
NC=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # Status Conditions
  STATUS=""

  # Unchanged flag
  FLAG=true

  # If there are unpushed changes...
  if [ -n "$(git cherry)" ]; then
    STATUS+="P"
    FLAG=false
  else
    STATUS+="."
  fi

  # If there are uncommitted changes...
  if [ -n "$(git diff --cached)" ]; then
    STATUS+="C"
    FLAG=false
  else
    STATUS+="."
  fi

  # If there are unstaged changes...
  if [ -n "$(git status --porcelain)" ]; then
    STATUS+="S"
    FLAG=false
  else
    STATUS+="."
  fi

  # If there are no changes...
  if [ "${FLAG}" = true ]; then
    printf "%s %s\n" $STATUS "${GREEN}${d}${NC}"
  else
    printf "%s %s\n" $STATUS "${RED}${d}*${NC}"
  fi

  cd .. # Move back
done
