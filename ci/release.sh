#!/bin/sh
export VERSION=`cat resource-semver/version`
echo "Packaging Release for version $VERSION"
echo `cat resource-source-code/target/classes/META-INF/build-info.properties`
BUILD_NAME=`cat resource-source-code/target/classes/META-INF/build-info.properties | grep build.name | cut -d'=' -f2`

cp resource-source-code/target/*${VERSION}.jar  resource-build-output/.
cp resource-source-code/target/classes/META-INF/build-info.properties resource-build-output/release-body
echo "${BUILD_NAME}" > resource-build-output/release-name
echo "${VERSION}" > resource-build-output/release-tag
