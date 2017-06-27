#!/bin/bash

# build Nuitka Compilation of our program
docker build -t build -f dockerfiles/Dockerfile.nuitka .

# Extract the pack folder into our root
id=$(docker create build)
docker cp $id:pack .