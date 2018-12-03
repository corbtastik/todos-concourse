#!/bin/sh
ls -al
export DETECTED=`cat ../resource-unit-output/detected`
static_build() {
    echo "static_build"
}

maven_build() {
    echo "maven_build"
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