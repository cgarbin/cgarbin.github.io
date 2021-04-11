#!/bin/bash
# Publish the site to the GitHub pages branch

echo "Remember to update the local page:"
echo "  bundle exec jekyll serve"

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
