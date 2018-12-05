# Concourse Pipelines for the Todo set of Apps

First a couple Concourse references:

1. [Stark and Wayne Concourse Tutorial](https://concoursetutorial.com)  
1. [Concourse](https://concourse-ci.org)

Concourse is hard to explain in a few works because it can be used for a cornucopia of purposes, that's probably why its generally described as a "continuous thing-doer" on [concourse-ci.org](https://concourse-ci.org).

For our purposes Concourse is used to implement 2 basic elements of CI/CD, namely continuous integration and delivery for the Todo set of apps.

There are 2 different types of pipelines in this repository.

1. Pipelines to create a software release and upload to github
2. Pipelines to deploy a software release from github to [Cloud Foundry](https://run.pivotal.io)

## How to use this stuff

You'll need [Concourse](https://concourse-ci.org/download.html) up and running or access to an existing deployment.

Next you should fork these repositories since you'll want to make commits.

1. [Todo(s) Concourse](https://github.com/corbtastik/todos-concourse.git)
1. [Todo(s) Version](https://github.com/corbtastik/todos-version.git)

There are 2 scripts provided for convenience.  One to [build releases](/pipeline_build.sh) and another to [deploy those releases to Cloud Foundry](/pipeline_deploy.sh).  

## Secrets

Secrets for commit access to the git resources are saved locally in ``creds.yml``, which should *NOT* be committed to scm.  As a safeguard ``creds.yml`` is added in ``.gitignore``.  So having said that, you'll need to roll your [github private key](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/), a [personal access token](https://github.com/settings/tokens) and Cloud Foundry creds in this file.

Here's what my ``creds.yml`` file looks like (replace the blah).

```yaml
resource_cf_api: https://api.run.pivotal.io
resource_cf_username: blah@blah.blah
resource_cf_password: blahblah
resource_cf_org: blah
resource_cf_space: blah
private-token-github: blahblahblahblahblahblahblahblahblah
private-key-github: |
  -----BEGIN RSA PRIVATE KEY-----
  blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah
  blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah
  blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah
  -----END RSA PRIVATE KEY-----
```

## Build Release Pipelines

The gist is you need the Concourse Resource for ci/scripts, the Version repo to control versioning, the Unit repo as the source to integrate and a Release repo to save the release bits.

Snippet of ``pipeline_build.sh`` that deploys one pipeline for the [Todo(s) API](https://github.com/corbtastik/todos-api) app.

```bash
fly sp -t todos-cicd -c pipeline-build-maven.yml -p todos-api-build -l creds.yml \
  -v build_name=todos-api \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/CHANGEME/todos-concourse.git \
  -v resource_unit_branch=master \
  -v resource_unit_uri=git@github.com:CHANGEME/todos-api.git \
  -v resource_version_branch=master \
  -v resource_version_bump=patch \
  -v resource_version_pre=HOWDY \
  -v resource_version_uri=git@github.com:CHANGEME/todos-version.git \
  -v resource_release_owner=CHANGEME \
  -v resource_release_repository=todos-api
```

Replace ``CHANGEME`` with your github user/org name.  Assuming you've forked the repos then you're all set to run ``pipeline_build.sh``.

This pulls 4 repositories...

1. [Todo(s) API](https://github.com/corbtastik/todos-api) - Todos backing API implemented in Spring Boot
2. [Todo(s) WebFlux](https://github.com/corbtastik/todos-webflux.git) - ^^^ using Reactive Stack
3. [Todo(s) Cloud Gateway](https://github.com/corbtastik/todos-cloud-gateway) - Spring Cloud Gateway edge router, sits between UI and API
4. [Todo(s) UI](https://github.com/corbtastik/todos-ui) - Vue.js Todos app

Then builds, tests and uploads release bits to each individual repository on Github.  New releases can be triggered by committing a new version of the ``version`` file in the [todos-version repo](https://github.com/corbtastik/todos-version) you forked :)

## Deploy Release Pipelines

The ``pipeline_deploy.sh`` script runs fly commands to create pipelines to deploy a release from Github to Cloud Foundry.  [Pivotal Web Services](https://run.pivotal.io) is used as the CF platform.  It needs the same ``creds.yml`` file as it also contains Cloud Foundry information.

Snippet of ``pipeline_deploy.sh`` that deploys one pipeline to take the release for [Todo(s) WebFlux](https://github.com/corbtastik/todos-webflux) and deploy to Cloud Foundry.

```bash
fly sp -t todos-cicd -c pipeline-deploy.yml -p todos-webflux-deploy -l creds.yml \
  -v build_artifact=todos-webflux \
  -v resource_concourse_branch=master \
  -v resource_concourse_uri=https://github.com/corbtastik/todos-concourse.git \
  -v resource_release_owner=corbtastik \
  -v resource_release_repository=todos-webflux  
```

This script pulls 4 releases from Github and pushes to Cloud Foundry.  You'll want to change the cf manifest files contained in the [``ci/manifest``](/ci/manifest) folder to suit your liking.

Once completed all apps should be running in CF.



<p align="center">
    <img src="https://github.com/corbtastik/todos-images/raw/master/todos-concourse/pipeline-build.png" width="480">
</p>