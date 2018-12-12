#!/bin/sh
export DETECTED=`cat resource-detect/detected`
if [ "${DETECTED}" = "node" ]; then
    export VERSION=`cat resource-version/version`
    echo "nodejs_build: $DETECTED $VERSION"
    cd resource-unit
    npm install
    cp -R . ../resource-build/
fi