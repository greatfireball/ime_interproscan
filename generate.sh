#!/bin/bash

export SOURCE_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# in case SOURCE_BRANCH is HEAD, we want to have the tag instead
# taken from https://stackoverflow.com/questions/3404936/show-which-git-tag-you-are-on
if [ ${SOURCE_BRANCH} = "HEAD" ]
then
    export SOURCE_BRANCH=$(git describe --tags)
fi

export DOCKER_REPO=greatfireball/ime_interproscan
export IMAGE_NAME="${DOCKER_REPO}":${SOURCE_BRANCH}

date +"[%Y-%m-%d %H:%M:%S] Starting image generation"
./hooks/build &>/dev/zero

if [ $? -ne 0 ]
then
    date +"[%Y-%m-%d %H:%M:%S] Image generation FAILED"
else
    date +"[%Y-%m-%d %H:%M:%S] Image generation PASSED"
    docker push ${IMAGE_NAME} &>/dev/zero
    ./hooks/post_push &>/dev/zero
fi
