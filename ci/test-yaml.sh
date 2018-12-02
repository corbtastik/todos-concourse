#!/bin/sh

# include parse_yaml function
. yaml.sh

# read yaml file
eval $(parse_yaml ./manifest/todos-api-manifest.yml "manifest_")

# access yaml content
echo $manifest_applications