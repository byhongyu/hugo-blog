#!/bin/bash
echo -e "Deploying updates to GitHub."
# Build the project.
hugo -t casper # if using a theme, replace with `hugo -t <YOURTHEME>`
# Go To Public folder
cd public
# Add changes to git.
git add .
# Commit changes.
msg="rebuilding site"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master
# Come Back up to the Project Root
cd ..
echo "done"
