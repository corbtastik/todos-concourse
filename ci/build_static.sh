#!/bin/sh
ls -al
export DETECTED=`cat resource-unit-output/detected`
export VERSION=`cat resource-version/version`
echo "static_build: $DETECTED $VERSION"
cp -R resource-source-code/* resource-build-output/
ls -al resource-build-output/
