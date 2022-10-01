#!/bin/bash
# Publish the site to the GitHub pages branch, making it public

# Do no publish uncommited changes
if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "There are uncommited changes - commit or stash them first"
    exit 1
fi

# Verify that we are not serving locally
# It will override the published site eventually, perhaps even in the middle of publishing
if pgrep -f "jekyll serve" > /dev/null; then
    echo ""
    echo "Jekyll is serving locally - stop it first"
    exit 1
fi

# Verify that we are not trying to publish a test version
#   Test version: bundle exec jekyll serve       <-- we don't want this
#   Production version: bundle exec jekyll build <-- we want this
# The test version uses "localhost" in the links
cd _site
if grep -Rq --include="*.html" localhost; then
    echo ""
    echo "This is a test version - use 'bundle exec jekyll build' to publish"
    exit 1
fi
cd ..

exit 0

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
