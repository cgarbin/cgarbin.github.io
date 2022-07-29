#!/bin/bash
# Publish the site to the GitHub pages branch, making it public

# This didn't quite work -- needs more testing
# export JEKYLL_ENV=production
# jekyll build

if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "There are uncommited changes - commit or stash them first"
    exit 1
fi

set -xe

mv _site ../_site-ghio
git checkout -B gh-pages
rm -rf -- *
mv ../_site-ghio/* .
git add .
git commit -m "Update site"
git push origin gh-pages --force
git checkout master
rm -rf ../_site-ghio
