#!/bin/bash

# Add all changes
git add .

# Get commit message from user
read -p "Enter the commit message: " commit_message

# Commit with the provided message
git commit -m "$commit_message"

# Push the changes
git push 

# Ask the user if they want to create a pull request
read -p "Do you want to create a pull request? (y/n): " create_pr

# Handle the user's decision
if [ "$create_pr" == "y" ]; then
  # This assumes you have a GitHub CLI installed and authenticated
  gh pr create
  echo "Pull request created."
else
  echo "No pull request created."
fi
