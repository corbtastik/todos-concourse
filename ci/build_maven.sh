#!/bin/sh
export MAVEN_OPTS="-Xms2g -Xmx2g"
export DETECTED=`cat resource-unit-output/detected`
export VERSION=`cat resource-version/version`
echo "maven_build: $DETECTED $VERSION"
cd resource-source-code
./mvnw versions:set -DnewVersion=${VERSION}
./mvnw clean package -Dmaven.test.skip=true
cd target/
cp -R . ../../resource-build-output/
