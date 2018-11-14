#!/bin/sh
export MAVEN_OPTS="-Xms2g -Xmx2g"
export VERSION=`cat resource-version/version`
echo "Building version $VERSION"
cd resource-source-code
  ./mvnw versions:set -DnewVersion=${VERSION}
  ./mvnw clean package -Dmaven.test.skip=true
cd ..
cp -R resource-source-code/target resource-build-output/.