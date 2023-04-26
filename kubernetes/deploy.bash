#!/bin/bash

source .env

helm install r1 . \
--set configs.defaultPassword=${DEFAULT_PASSWORD} \
--set image.tag=${IMAGE_TAG}
