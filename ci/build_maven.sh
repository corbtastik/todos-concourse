#!/bin/sh
export DETECTED=`cat resource-detect/detected`
if [ "${DETECTED}" = "maven" ]; then
  export VERSION=`cat resource-version/version`
  export SKIP_UNIT_TESTS=true
  echo "maven_build: ${DETECTED} ${VERSION}"
  cd resource-unit
  ./mvnw versions:set -DnewVersion=${VERSION}
  ./mvnw clean package -Dmaven.test.skip=${SKIP_UNIT_TESTS}
  cd target/
  cp -R . ../../resource-build/  
fi
