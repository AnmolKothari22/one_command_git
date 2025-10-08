#!/bin/bash
# Usage (format): ./one_command_git.sh "Your commit message" [branch_name]

if [ -z "$1" ]; then
	echo "Usage: ./one_command_git.sh \"Commit message\" [branch_name]"
    	exit 1
fi

COMMIT_MSG="$1"
BRANCH_NAME="$2"

# If branch name is given, switch/create branch
if [ ! -z "$BRANCH_NAME" ]; then
    git checkout -b "$BRANCH_NAME" 2>/dev/null || git checkout "$BRANCH_NAME"
fi


# Stage all changes
git add .

# Commit changes
git commit -m "$COMMIT_MSG"

# Pull latest changes
git pull --rebase

# Push changes
git push

echo "Git workflow completed!"



