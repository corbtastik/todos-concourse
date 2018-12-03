#!/bin/sh
ls -al
cd resource-source-code
if [ -e index.html ]
then
    echo "staticfile" > ../resource-unit-output/detected
elif [ -e pom.xml ]
then
    echo "maven" > ../resource-unit-output/detected
elif [ -e build.grade ]
then
    echo "gradle" > ../resource-unit-output/detected
elif [ -e package.json ]
then
    echo "node" > ../resource-unit-output/detected
else
    echo "null unit"
fi
echo "detected:"
cat ../resource-unit-output/detected
cd ..