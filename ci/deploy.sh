#!/bin/bash
BUILD_VERSION=`cat resource-release/version`
tar xf resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}-release.tar

# cp resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar resource-deploy/
#     sed -e "s/\${artifact}/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar/" \
#     resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest.yml
