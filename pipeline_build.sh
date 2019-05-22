#!/bin/bash
if [ -z "$1" ] 
then
    echo "Please enter an app (for example todos-api)"
    exit 1
fi
APP=$1
# Set these variables to suit your needs
PIPELINE_NAME=${APP}-build  
BUILD_NAME=${APP}
UNIT_BRANCH=master
UNIT_URI=git@github.com:corbtastik/${APP}.git
VERSION_BRANCH=master
VERSION_URI=git@github.com:corbtastik/todos-version.git
VERSION_BUMP=patch
VERSION_TAG=HOWDY
RELEASE_REPOSITORY=${APP}
RELEASE_OWNER=corbtastik
fly sp -t ci -c pipeline-build-maven.yml -p ${PIPELINE_NAME} -l creds.yml \
  -v build_name=${BUILD_NAME} \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_unit_branch=${UNIT_BRANCH} \
  -v resource_unit_uri=${UNIT_URI} \
  -v resource_version_branch=${VERSION_BRANCH} \
  -v resource_version_bump=${VERSION_BUMP} \
  -v resource_version_pre=${VERSION_TAG} \
  -v resource_version_uri=${VERSION_URI} \
  -v resource_release_owner=${RELEASE_OWNER} \
  -v resource_release_repository=${RELEASE_REPOSITORY}
