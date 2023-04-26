#!/bin/bash

if [ -z "${WORKER_ID}" ]
then
    export WORKER_ID=$(date +"%Y%m%d-%H%M%S")
fi

audit-agent -c /data/config.json
