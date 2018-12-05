#!/bin/sh
export DETECTED=`cat resource-detect/detected`
if [ "${DETECTED}" = "static" ]; then
    export VERSION=`cat resource-version/version`
    echo "static_build: $DETECTED $VERSION"
    cd resource-unit
    npm install
    cp -R . ../resource-build/
fi