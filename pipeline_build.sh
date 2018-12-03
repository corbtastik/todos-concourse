#!/bin/bash

fly sp -t todos-cicd -c pipeline-build.yml -p todos-api-build -l creds.yml \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_source_code_branch=master \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-api.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git  

fly -t todos-cicd unpause-pipeline -p todos-api-build
  