#!/bin/bash

source .env
helm upgrade -i r1 . --set image.tag=${IMAGE_TAG}
