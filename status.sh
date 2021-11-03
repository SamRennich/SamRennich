#!/bin/bash

# Check every repository for status

# Text Colors
RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
NC='\033[0m' # No Color

# For every dir...
for d in */; do
  cd $d # Move to dir

  # If there are changes...
  if [ -n "$(git status --porcelain)" ]; then
    echo -e "$d ${RED}Changes${NC}"
  else # If there are no changes...
    echo -e "$d ${GREEN}No Changes${NC}"
  fi

  cd .. # Move back
done
