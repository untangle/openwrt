#!/bin/sh -x

# A utility script to rebuild images using local packetd and sync-settings builds

make package/packetd/clean UNTANGLE_VERSION=master
if [ -d /home/$USER/go/src/github.com/untangle/packetd ] ; then
    make package/packetd/prepare USE_SOURCE_DIR=/home/$USER/go/src/github.com/untangle/packetd UNTANGLE_VERSION=master
elif [ -d /home/$USER/packetd ] ; then
    make package/packetd/prepare USE_SOURCE_DIR=/home/$USER/packetd UNTANGLE_VERSION=master
fi

make package/sync-settings/clean UNTANGLE_VERSION=master
make package/sync-settings/prepare USE_SOURCE_DIR=/home/$USER/sync-settings UNTANGLE_VERSION=master

make -j16 UNTANGLE_VERSION=master

