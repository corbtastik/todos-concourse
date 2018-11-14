#!/bin/sh
export VERSION=`cat resource-version/version`
echo "Packaging Release for version $VERSION"
echo `cat resource-build-output/target/classes/META-INF/build-info.properties`
BUILD_NAME=`cat resource-build-output/target/classes/META-INF/build-info.properties | grep build.name | cut -d'=' -f2`

cp resource-build-output/target/classes/META-INF/build-info.properties resource-release-output/release-body
echo "${BUILD_NAME}" > resource-release-output/release-name
echo "${VERSION}" > resource-release-output/release-tag
