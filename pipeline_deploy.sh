#!/bin/bash

# fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-webflux-deploy -l creds.yml \
#   -v resource_concourse_branch=master \
#   -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
#   -v resource_release_owner=corbtastik \
#   -v resource_release_repository=todos-webflux  

# fly -t todos-cicd unpause-pipeline -p todos-webflux-deploy

fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-ui-deploy -l creds.yml \
  -v build_artifact=todos-ui \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-ui  

fly -t todos-cicd unpause-pipeline -p todos-ui-deploy
  