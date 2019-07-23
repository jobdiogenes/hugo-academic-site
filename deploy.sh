#!/usr/bin/env bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t academic

# Update GitHub Public Page Repository
hugodir=`pwd`
cd ../jobdiogenes.github.io
cp -av /Users/chengjun/github/mywebsite-hugo/public/* .

# Add changes to git.
git add -A

# Commit changes.
msg="site updated in `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd $hugodir