#!/bin/bash

if [ -z "${WORKER_ID}" ]
then
    export WORKER_ID=$(date +"%Y%m%d-%H%M%S")
    echo "#### Using WORKER_ID=[${WORKER_ID}] ####"
fi

xmrig -c /data/config.json
