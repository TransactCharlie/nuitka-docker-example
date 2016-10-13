#!/bin/bash
# This script copies link libs (.so) identified by ldd into a folder
# For us - this is important to collect together the libs as we
# will be creating a standalone image starting from a base with **nothing**
#
# the linker lib (the one ld uses to dynamically link) needs remain at a set
# known location. (the elf bainary created app.exe) knows where this linker
# library is and will not look anywhere else for it.
# on ubuntu 64bit this is /lib64/ld-linux-x86-64.so.2 and is commonly itself
# a symbolically linked lib to a versioned .so in /lib...

APP=$1
COPY_TO=$2

# Copy all the libs that are actually dynamically found
ldd ${APP} | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp --no-clobber -v '{}' ${COPY_TO}

# Copy the fixed ld.so linker lib to app.dist/<fixed>/<linker_lib>.sp
ldd ${APP} | grep -v "=>" | awk '{print $1}' | xargs -I '{}' cp --parents -v '{}' ${COPY_TO}
