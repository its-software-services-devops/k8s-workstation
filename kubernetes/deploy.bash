#!/bin/bash

source .env

helm upgrade -i r1 . \
--set configs.defaultPassword=${DEFAULT_PASSWORD} \
--set image.tag=${IMAGE_TAG}
