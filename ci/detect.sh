#!/bin/sh
cd resource-source-code
if [ -e index.html ]
then
    echo "staticfile" > ../resource-detect-output/detected
fi

if [ -e pom.xml ]
then
    echo "maven" > ../resource-detect-output/detected
fi

if [ -e build.gradle ]
then
    echo "gradle" > ../resource-detect-output/detected
fi

if [ -e package.json ]
then
    echo "node" > ../resource-detect-output/detected
fi

if [ -e ../resource-detect-output/detected ]
then
    echo "detected:"
    cat ../resource-detect-output/detected
else 
    echo "Nothing detected, /detected=false"
fi
cd ..