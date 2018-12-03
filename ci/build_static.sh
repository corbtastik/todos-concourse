#!/bin/sh
ls -al
export DETECTED=`cat resource-unit-output/detected`
if [ "${DETECTED}" = "static" ]; then
    export VERSION=`cat resource-version/version`
    echo "static_build: $DETECTED $VERSION"
    cd resource-source-code
    cp -R . ../resource-build-output/
    cd ..
    cd resource-build-output
    ls -al
    cd ..
fi