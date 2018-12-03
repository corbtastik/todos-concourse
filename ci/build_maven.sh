#!/bin/sh
export DETECTED=`cat resource-unit-output/detected`
if [ "${DETECTED}" = "maven" ]; then
  export VERSION=`cat resource-version/version`
  export SKIP_UNIT_TESTS=true
  echo "maven_build: ${DETECTED} ${VERSION}"
  cd resource-source-code
  ./mvnw versions:set -DnewVersion=${VERSION}
  ./mvnw clean package -Dmaven.test.skip=${SKIP_UNIT_TESTS}
  cd target/
  cp -R . ../../resource-build-output/  
fi
