#!/bin/bash
fly sp -t todos-cicd -c pipeline-build-maven.yml -p todos-api-build -l creds.yml \
  -v build_name=todos-api \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_unit_branch=master \
  -v resource_unit_uri=git@github.com:corbtastik/todos-api.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-api \

fly sp -t todos-cicd -c pipeline-build-maven.yml -p todos-webflux-build -l creds.yml \
  -v build_name=todos-webflux \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_unit_branch=master \
  -v resource_unit_uri=git@github.com:corbtastik/todos-webflux.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-webflux \

fly sp -t todos-cicd -c pipeline-build-maven.yml -p todos-cloud-gateway-build -l creds.yml \
  -v build_name=todos-cloud-gateway \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_unit_branch=master \
  -v resource_unit_uri=git@github.com:corbtastik/todos-cloud-gateway.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-cloud-gateway \

fly sp -t todos-cicd -c pipeline-build-static.yml -p todos-ui-build -l creds.yml \
  -v build_name=todos-ui \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_unit_branch=master \
  -v resource_unit_uri=git@github.com:corbtastik/todos-ui.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-ui \

fly -t todos-cicd unpause-pipeline -p todos-api-build
fly -t todos-cicd unpause-pipeline -p todos-webflux-build
fly -t todos-cicd unpause-pipeline -p todos-cloud-gateway-build
fly -t todos-cicd unpause-pipeline -p todos-ui-build   