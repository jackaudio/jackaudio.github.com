#!/bin/bash

set -e

if [ ! -d .bundle ]; then
    gem update --user-install
    gem install bundler --user-install
    bundle install --path .bundle
fi

bundle exec jekyll serve --watch --host=0.0.0.0
