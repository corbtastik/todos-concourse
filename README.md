# Concourse Pipelines for the Todo set of Apps

## Basic Pipeline

### Resources

1. Git-Resource: source-code  
1. Semver-Resource: version-code

### Jobs

## Setting a Pipeline

```bash
$ fly sp -t todos-cicd -c pipeline.yml -p todos-webflux -l creds.yml
```

## Un-Pausing a Pipeline

```bash
$ fly -t todos-cicd unpause-pipeline -p todos-webflux
```

## Un-Pausing a Job within a Pipeline

```bash
$ fly -t todos-cicd unpause-job --job todos-webflux/job-build
```

## Trigger Jobs

```bash
$ fly -t todos-cicd trigger-job -j todos-webflux/job-build
```

## Destroying a Pipeline

```bash
$ fly -t todos-cicd destroy-pipeline -p todos-webflux
```