#!/bin/bash
# Publish the site to the GitHub pages branch, making it public

echo "Remember to publish and test locally first:"
echo "  bundle exec jekyll serve"

if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "There are uncommited changes - commit them first"
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
