#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path-to-directory> <remote-repository-url>"
    exit 1
fi

# Assign arguments to variables
DIRECTORY=$1
REMOTE_REPO=$2

# Initialize local git repository
git init

# Add the remote repository
git remote add origin $REMOTE_REPO

# Add all files in the specified directory
git add $DIRECTORY

# Commit the changes with the message "Initial commit"
git commit -m "Initial commit"

# Push the changes to the remote repository
git push -u origin main

echo "Successfully pushed the contents of $DIRECTORY to $REMOTE_REPO"
