#!/bin/bash

TAG=$1
docker build -t ${TAG} -f dockerfiles/Dockerfile.base .