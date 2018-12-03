#!/bin/sh
export DETECTED=`cat ../resource-detect-output/detected`
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

function static_build() {
    echo "static_build"
}

function maven_build() {
    echo "maven_build"
}

function gradle_build() {
    echo "gradle_build"
}

function node_build() {
    echo "node_build"
}

function null_build() {
    echo "null_build"
}