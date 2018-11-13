#!/bin/sh
export MAVEN_OPTS="-Xms2g -Xmx2g"
export VERSION=`cat resource-semver/version`
echo "Building version $VERSION"
cd resource-source-code
  ./mvnw versions:set -DnewVersion=${VERSION}
  ./mvnw clean package -Dmaven.test.skip=true
cd ..

cp resource-source-code/target/todos-webflux-${VERSION}.jar  resource-build-output/.

echo "todos-webflux" > resource-build-output/release-name
echo "${VERSION}" > resource-build-output/release-tag
echo "todos-webflux version ${VERSION}" > resource-build-output/release-body
