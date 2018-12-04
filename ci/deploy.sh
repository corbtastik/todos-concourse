#!/bin/bash
BUILD_TIME=`cat resource-release/body | grep -w "build.time" | cut -d'=' -f2`
BUILD_NAME=`cat resource-release/body | grep -w "build.name" | cut -d'=' -f2`
BUILD_ARTIFACT=`cat resource-release/body | grep -w "build.artifact" | cut -d'=' -f2`
BUILD_GROUP=`cat resource-release/body | grep -w "build.group" | cut -d'=' -f2`
BUILD_VERSION=`cat resource-release/body | grep -w "build.version" | cut -d'=' -f2`
cat resource-release/body
tar xf resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}-release.tar
ls -al
ls -al resource-release/
# cp resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar resource-deploy/
# sed -e "s/\${artifact}/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar/" \
#     resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest.yml
