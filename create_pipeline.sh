#!/bin/bash

fly sp -t todos-cicd -c pipeline-atomic.yml -p todos-webflux-release -l creds.yml \
  -v resource_source_code_uri=git@github.com:corbtastik/todos-webflux.git \
  -v resource_version_uri=git@github.com:corbtastik/todos-version.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-webflux