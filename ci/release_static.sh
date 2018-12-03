#!/bin/sh
export VERSION=`cat resource-version/version`
export BUILD_NAME='todos-ui'
echo "Packaging Release for $BUILD_NAME version $VERSION" > resource-release-output/release-body
echo "${BUILD_NAME}" > resource-release-output/release-name
echo "${VERSION}" > resource-release-output/release-tag
tar cf resource-release-output/${BUILD_NAME}-${VERSION}-release.tar resource-build-output
