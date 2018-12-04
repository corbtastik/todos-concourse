#!/bin/sh
ls -al
cd resource-unit
if [ -e index.html ]
then
    echo "static" > ../resource-detect/detected
elif [ -e pom.xml ]
then
    echo "maven" > ../resource-detect/detected
elif [ -e build.grade ]
then
    echo "gradle" > ../resource-detect/detected
elif [ -e package.json ]
then
    echo "node" > ../resource-detect/detected
else
    echo "null unit"
fi
echo "detected:"
cat ../resource-detect/detected
cd ..