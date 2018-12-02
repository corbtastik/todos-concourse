#!/bin/sh
cd resource-source-code
if [ -e index.html ]
then
    echo "staticfile" > ../resource-detect-output/detected
elif [ -e pom.xml ]
then
    echo "maven" > ../resource-detect-output/detected
elif [ -e build.grade ]
then
    echo "gradle" > ../resource-detect-output/detected
elif [ -e package.json ]
then
    echo "node" > ../resource-detect-output/detected
else
    echo "null" > ../resource-detect-output/detected
fi
echo "detected:"
cat ../resource-detect-output/detected
cd ..