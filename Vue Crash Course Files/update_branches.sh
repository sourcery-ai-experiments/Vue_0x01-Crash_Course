#!/bin/bash

# Array of branches
branches=("v1" "Mac_V1")

# Save the current branch
current_branch=$(git branch --show-current)

# Function to update branch
update_branch() {
  echo "Updating $branch..."
  git checkout $branch
  git pull --rebase origin main
  if [ $? -ne 0 ]; then
    echo "Resolve conflicts and continue rebase for $branch"
    exit 1
  fi
  git push origin $branch --force-with-lease
}

# Update each branch
for branch in "${branches[@]}"; do 
  update_branch $branch
done

# Switch back to the original branch
git checkout $current_branch

echo "All branches are updated with main and switched back to $current_branch."
