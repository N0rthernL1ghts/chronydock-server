#!/usr/bin/env sh
set -e

# Build development friendly image with addition of nano and bash.

docker build -t local/nlss-chronyd .
docker build -t local/nlss-chronyd:dev . -f Dockerfile.dev
