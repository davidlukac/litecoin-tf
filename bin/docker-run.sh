#!/usr/bin/env bash

set -xe

declare APP
declare CONTAINER

source .env

docker run \
  --rm \
  -it \
  --name "${APP}" \
  -v $(pwd)/:/opt/app \
  -v "${HOME}/.kube":/home/terraform/.kube \
  "${CONTAINER}"
