#!/usr/bin/env bash
set -e

bundle exec jekyll build
bundle exec htmlproofer --disable_external --allow-hash-href ./_site
