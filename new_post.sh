#!/bin/bash

set -e

if [ ! $2 ]; then
    echo "Usage: ${0} \"New Post Title\" \"Author\"."
    exit 1
fi

dir="_posts"
title="${1}"
author="${2}"
date=$(date +%Y-%m-%d)
datetime=$(date +%Y-%m-%dT%T%z)

# Only numbers, letters and hyphen allowed in a lowercase filename
name=`echo ${title,,}  | sed 's/ /-/g'`
name=`echo ${name} | sed 's/[^0-9a-z-]*//g'`
file="${dir}/${date}-${name}.md"

cat <<EOF >${file}
---
title: "${title}"
author: "${author}"
date: "${datetime}"
---
EOF

echo "File created at ${file}"
