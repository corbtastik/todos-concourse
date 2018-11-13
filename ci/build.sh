#!/bin/sh
export MAVEN_OPTS="-Xms2g -Xmx2g"
export VERSION=`cat version/number`
echo "Building version $VERSION"
cd resource-source-code
  ./mvnw clean package -Dversion=${VERSION} -Dmaven.test.skip=true
cd ..

cp resource-source-code/target/todos-webflux-${VERSION}.jar  resource-build-output/.