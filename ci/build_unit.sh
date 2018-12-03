#!/bin/sh
ls -al
export DETECTED=`cat resource-unit-output/detected`
export VERSION=`cat resource-version/version`

static_build() {
    echo "static_build"
    cd resource-source-code

    cd ..
}

maven_build() {
    echo "maven_build"
    local MAVEN_OPTS="-Xms2g -Xmx2g"
    echo "Building version $VERSION"
    cd resource-source-code
    ./mvnw versions:set -DnewVersion=${VERSION}
    ./mvnw clean package -Dmaven.test.skip=true
    cd ..
    cp -R resource-source-code/target resource-build-output/.    
}

gradle_build() {
    echo "gradle_build"
}

node_build() {
    echo "node_build"
}

null_build() {
    echo "null_build"
}

case $DETECTED in
    [staticfile]* )
        static_build
        break;;
    [maven]* )
        maven_build
        break;;
    [gradle]* )
        gradle_build
        break;;
    [node]* )
        node_build
        break;;                
    * ) null_build;;
esac