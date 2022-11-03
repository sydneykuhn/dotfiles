#!/bin/bash

# make the GitHub repo and clone it down
gh repo create $1 --public --gitignore $2 --add-readme --clone

# add the GitHub Action for Linting
cd $1
mkdir -p .github/workflows
cd .github/workflows
echo $2

cp ~/scripts/main.yml ./main.yml
cd ../..
echo '' >> ./README.md
echo '' >> ./README.md
echo "[![Mr Coxall's Super Linter](https://github.com/ics4u-1-2022/$1/workflows/Mr%20Coxall's%20Super%20Linter/badge.svg)](https://github.com/ics4u-1-2022/$1/actions)" >> ./README.md

git add .github/workflows/main.yml

# update remote
git add -A
git commit -m "init"
git push origin main
