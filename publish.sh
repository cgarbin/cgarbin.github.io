#!/bin/bash

echo "Remember to update the local page:"
echo "  bundle exec jekyll serve"

mv _site ../_site-ghio
git checkout -B gh-pages
rm -rf *
mv ../_site-ghio _site
git add .
git commit -m "Update site"
git push origin gh-pages --force
git checkout master
