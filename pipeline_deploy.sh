#!/bin/bash
if [ -z "$1" ] 
then
    echo "Please enter an app (for example todos-api)"
    exit 1
fi
APP=$1
# Set these variables to suit your needs
PIPELINE_NAME=${APP}-deploy  
BUILD_ARTIFACT=${APP}
RELEASE_REPOSITORY=${APP}
RELEASE_OWNER=corbtastik

fly sp -t ci -c pipeline-deploy.yml -p ${PIPELINE_NAME} -l creds.yml \
  -v build_artifact=${BUILD_ARTIFACT} \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=${RELEASE_OWNER} \
  -v resource_release_repository=${RELEASE_REPOSITORY}
