#!/bin/sh
env
export VERSION=`cat resource-version/version`
echo "Packaging Release for $BUILD_NAME version $VERSION" > resource-release-output/release-body
echo "${BUILD_NAME}" > resource-release-output/release-name
echo "${VERSION}" > resource-release-output/release-tag
pushd resource-build-output
tar cf ${BUILD_NAME}-${VERSION}-release.tar *
mv ${BUILD_NAME}-${VERSION}-release.tar ../resource-release-output/
popd