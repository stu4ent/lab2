#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Directory route and Repo-URL: "
	exit 1
fi

directory="$1"
github_repo="$2"

git init "$directory"

cd "directory"

git add .

git commit -m "Initial commit"

git remote add origin "$github_repo"
