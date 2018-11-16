#!/bin/bash
ARTIFACT_REGEX="([A-Za-z0-9_.-]*)\\-(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\-([A-Za-z0-9_.-]*)\\.([0-9A-Za-z-]+)$"

if [ -z "$1" ]
then
    part='all'
fi
if [ -z "$2" ]
then
    echo "Illegal argument, please pass text to parse."
    exit 1
fi 

part=$1
artifact=$2

if [[ "$artifact" =~ $ARTIFACT_REGEX ]]; then
    for i in "${!BASH_REMATCH[@]}"; do 
        printf "%s\t%s\n" "$i" "${BASH_REMATCH[$i]}"
    done    
else
    echo "artifact $artifact does not match format 'major.minor.path-METATAG.suffix'"
fi

case $part in
    all)
        echo "all ${BASH_REMATCH[0]}"
        ;;
    app)
        echo "app ${BASH_REMATCH[1]}"
        ;;
    major)
        echo "major ${BASH_REMATCH[2]}"
        ;;
    minor)
        echo "minor ${BASH_REMATCH[3]}"
        ;;
    patch)
        echo "patch ${BASH_REMATCH[4]}"
        ;;        
    tag)
        echo "tag ${BASH_REMATCH[5]}"
        ;;        
    type)
        echo "type ${BASH_REMATCH[6]}" 
        ;;        
    *)
        echo ${artifact}
esac