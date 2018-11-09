#!/bin/sh
export MAVEN_OPTS="-Xms2g -Xmx2g"
# export VERSION=`cat resource-source-code/version`
export VERSION='1.0.0.CHANGEME'
echo "Building version $VERSION"
ls -al
cd resource-source-code
  ./mvnw clean package -Dversion=${VERSION} -Dmaven.test.skip=true
cd ..

cp resource-source-code/target/todos-webflux-${VERSION}.jar  resource-build-output/.