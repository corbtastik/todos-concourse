#!/bin/bash
fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-api-deploy -l creds.yml \
  -v build_artifact=todos-api \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-api

fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-webflux-deploy -l creds.yml \
  -v build_artifact=todos-webflux \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-webflux  

fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-cloud-gateway-deploy -l creds.yml \
  -v build_artifact=todos-cloud-gateway \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-cloud-gateway  

fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-ui-deploy -l creds.yml \
  -v build_artifact=todos-ui \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-ui  

fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-nodejs-deploy -l creds.yml \
  -v build_artifact=todos-nodejs \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-nodejs  

fly -t todos-cicd unpause-pipeline -p todos-api-deploy
fly -t todos-cicd unpause-pipeline -p todos-webflux-deploy
fly -t todos-cicd unpause-pipeline -p todos-cloud-gateway-deploy
fly -t todos-cicd unpause-pipeline -p todos-ui-deploy
fly -t todos-cicd unpause-pipeline -p todos-nodejs-deploy