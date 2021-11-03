#!/bin/bash

# Pull from origin for every repository

# Text Colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

# For every dir...
for d in */; do
  cd $d # Move to dir
  git pull --quiet # Pull without printing
  printf "%-20s %s\n" $d "${GREEN}Up to Date${NC}"
  cd .. # Move back
done
