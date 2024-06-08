#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: path to directory and remote repository url"
    exit 1
fi

# Assign arguments to variables
DIRECTORY=$1
REMOTE_REPO=$2

# Initialize local git repository in the specified directory
cd $DIRECTORY
git init

# Add all files in the specified directory
git add .

# Commit the changes with the message "Initial commit"
git commit -m "Initial commit"

# Add the remote repository
git remote add origin $REMOTE_REPO

# Push the changes to the remote repository
git push -u origin master

echo "Successfully moved $DIRECTORY content to $REMOTE_REPO"
