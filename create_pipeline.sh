#!/bin/bash

fly sp -t todos-cicd -c pipeline-release.yml -p todos-webflux-release -l creds.yml \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-webflux.git \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-webflux

fly sp -t todos-cicd -c pipeline-release.yml -p todos-api-release -l creds.yml \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-api.git \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-api

fly sp -t todos-cicd -c pipeline-release.yml -p todos-cloud-gateway-release -l creds.yml \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-cloud-gateway.git \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-cloud-gateway

fly sp -t todos-cicd -c pipeline-release.yml -p todos-ui -l creds.yml \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-ui.git \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-ui  