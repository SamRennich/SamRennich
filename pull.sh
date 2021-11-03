#!/bin/bash

# Pull from origin for every repository

# Text Colors
GREEN='\033[0;32m' # Green
NC='\033[0m' # No Color

# For every dir...
for d in */; do
  cd $d # Move to dir
  git pull --quiet # Pull without printing
  echo -e "$d is now ${GREEN}Up to Date${NC}"
  cd .. # Move back
done
