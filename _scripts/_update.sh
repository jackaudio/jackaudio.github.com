#!/bin/bash

set -e

cd $(dirname $0)/..

if [ ! -d .bundle ]; then
    bundle install --path .bundle
fi

bundle exec jekyll build

if [ ! -d _jack1 ]; then
    git clone --recursive git@github.com:jackaudio/jack1 _jack1
fi
# if [ ! -d _jack2 ]; then
#     git clone --recursive git@github.com:jackaudio/jack2 _jack2
# fi

pushd _jack1
if [ ! -f configure ]; then
./autogen.sh
fi
if [ ! -f Makefile ]; then
./configure \
    --enable-force-install \
    --prefix=/usr          \
    --disable-alsa         \
    --disable-firewire
fi
rm -rf doc/reference doc/reference.doxygen
git pull && git submodule update && make -j 4
popd

# pushd _jack2
# if [ ! -d build ]; then
# ./waf configure     \
#     -o build        \
#     --alsa=no       \
#     --firewire=no   \
#     --iio=no        \
#     --portaudio=no  \
#     --winmme=no     \
#     --celt=no       \
#     --opus=no       \
#     --samplerate=no \
#     --sndfile=no    \
#     --readline=no   \
#     --systemd=no    \
#     --db=no         \
#     --doxygen=yes   \
#     --htmldir=/api
# fi
# rm -rf tmp-install
# git pull && ./waf build -j4 && ./waf install --destdir=$(pwd)/tmp-install
# popd

rm -rf _site/api
mv _jack1/doc/reference/html _site/api

git add _site
git commit -a -m "Update static pages" && git push || echo "nothing to commit"

ssh -A jackaudio.org bash <<EOF
set -e
cd ~/sites/jackaudio
git pull
EOF
