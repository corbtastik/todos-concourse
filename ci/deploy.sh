#!/bin/bash
BUILD_VERSION=`cat resource-release/version`
tar xf resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}-release.tar
if [ -e ${BUILD_ARTIFACT}-${BUILD_VERSION}.jar ]; then
    echo "jar file ${BUILD_ARTIFACT}-${BUILD_VERSION}.jar found"
    cp ${BUILD_ARTIFACT}-${BUILD_VERSION}.jar resource-deploy/
    sed -e "s/\${artifact}/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar/" \
        resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest-cicd.yml    
fi

if [ -e index.html ]; then
    echo "index.html found"
    ls -al
    cat resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest-cicd.yml
fi