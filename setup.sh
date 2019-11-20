#!/bin/bash

set -e

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
    echo "Setup and run Jekyll"
    echo ""
    echo "Usage: ${0} [option]"
    echo ""
    echo "Options:"
    echo "-d, --doxygen      Build Doxygen documentation."
    echo ""
    exit 0
fi
if [ ! -d .bundle ]; then
    gem update --user-install
    gem install bundler --user-install
    bundle install --path .bundle
fi
if [ "${1}" == "-d" ] || [ "${1}" == "--doxygen" ]; then
    if [ ! -d _jack1 ]; then
        git clone --recursive git@github.com:jackaudio/jack1 _jack1
    fi
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
    git pull && git submodule update && make -j $(nproc)
    popd
    rm -rf api
    mv _jack1/doc/reference/html api
fi

bundle exec jekyll serve --watch --host=0.0.0.0
