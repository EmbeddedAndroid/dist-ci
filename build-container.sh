#!/bin/sh -ex

container="dist-ci"
gl=$(git log -1 --pretty="format:%h %s")
hash=$(echo $gl | cut -d\  -f1)

# get jobserv version
gl="DistCI: $gl
JobServ $(docker run --rm jobserv env | grep APP_VERSION | cut -d= -f2)"

echo "Building $container:$hash"
docker build --build-arg "DIST_CI_VERSION=$gl" -t $container .
