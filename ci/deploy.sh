#!/bin/bash
BUILD_VERSION=`cat resource-release/version`
tar xf resource-release/${BUILD_ARTIFACT}-${BUILD_VERSION}-release.tar -C resource-deploy/
if [ -e resource-deploy/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar ]; then
    echo "jar file resource-deploy/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar found"
    sed -e "s/\${artifact}/${BUILD_ARTIFACT}-${BUILD_VERSION}.jar/" \
        resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest-cicd.yml    
fi

if [ -e resource-deploy/index.html ]; then
    echo "resource-deploy/index.html found"
    cat resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest-cicd.yml
fi

if [ -e resource-deploy/package.json ]; then
    echo "resource-deploy/package.json found"
    cat resource-concourse/ci/manifest/${BUILD_ARTIFACT}-manifest.yml > resource-deploy/manifest-cicd.yml
fi