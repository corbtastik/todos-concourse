#!/bin/sh
ls -al
export DETECTED=`cat resource-detect/detected`
if [ "${DETECTED}" = "static" ]; then
    export VERSION=`cat resource-version/version`
    echo "static_build: $DETECTED $VERSION"
    cd resource-unit
    cp -R . ../resource-build/
    cd ..
    cd resource-build
    ls -al
    cd ..
fi