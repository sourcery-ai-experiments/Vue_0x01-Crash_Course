#!/bin/bash

# Array of branches
branches=("v1" "Mac_V1")

# Update each branch
for branch in "${branches[@]}"; do
  echo "Updating $branch..."
  git checkout $branch
  git pull --rebase origin main
  if [ $? -ne 0 ]; then
    echo "Resolve conflicts and continue rebase"
    exit 1
  fi
  git push origin $branch --force-with-lease
done

echo "All branches are updated with main."
