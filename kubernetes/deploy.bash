#!/bin/bash

source .env

helm install r1 . --namespace xmrig \
--set configs.defaultPassword=${DEFAULT_PASSWORD} \
--set image.tag=${IMAGE_TAG}
