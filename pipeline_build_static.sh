#!/bin/bash

fly sp -t todos-cicd -c pipeline-static-build.yml -p todos-ui-build -l creds.yml \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_source_code_branch=master \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-ui.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git  

fly -t todos-cicd unpause-pipeline -p todos-ui-build
  