#!/bin/bash

if [ -z "${WORKER_ID}" ]
then
    echo "#### Using WORKER_ID=[${WORKER_ID}] ####"
    export WORKER_ID=$(date +"%Y%m%d-%H%M%S")
fi

audit-agent -c /data/config.json
