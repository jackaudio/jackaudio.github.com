#!/usr/bin/env bash
set -e

bundle exec jekyll build
bundle exec htmlproofer --allow-hash-href --disable-external --empty-alt-ignore ./_site
