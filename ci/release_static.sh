#!/bin/sh
env
export VERSION=`cat resource-version/version`
echo "Packaging Release for $BUILD_NAME version $VERSION" > resource-release/release-body
echo "${BUILD_NAME}" > resource-release/release-name
echo "${VERSION}" > resource-release/release-tag
cd resource-build
tar cf ${BUILD_NAME}-${VERSION}-release.tar *
mv ${BUILD_NAME}-${VERSION}-release.tar ../resource-release/
cd ..