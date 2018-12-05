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

Next you should [fork this repository](https://github.com/corbtastik/todos-concourse) so you'll be able to make commits to the scripts and pipelines as needed out of your repo.  Once you've forked, just clone as normal and replace ``https://github.com/corbtastik/todos-concourse.git`` with ``https://github.com/YOU/todos-concourse.git`` in the scripts and you'll be cooking with gas.

There are 2 scripts provided for convenience.  One to build releases and another to deploy those releases to Cloud Foundry.  

**pipeline_build.sh** 

This script runs fly commands to create release pipelines for each application (``resource_unit_uri``) and branch (``resource_unit_branch``).  Secrets for commit access to the git resources are saved locally in ``creds.yml``, which should *NOT* be committed to scm (may peanut butter be stuck between your toes should you commit this file).  As a safeguard ``creds.yml`` is added in ``.gitignore``.  So having said that, you'll need to roll your [github private key](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/) and cloud foundry creds in this file.

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

```bash
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
  -v resource_release_repository=todos-api
``` 