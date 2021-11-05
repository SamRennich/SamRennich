#!/bin/bash

# Check for updates from origin for every repository

# Key
# U = Updates are Available

# Text Colors
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)

# For every dir...
for d in */; do
  cd $d # Move to dir

  # If out of date...
  if [ -n "$(git remote show origin | grep 'local out of date')" ]; then printf "%s %s\n" "${RED}U${NORMAL}" $d; fi

  cd .. # Move back
done
