#!/bin/bash

echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd

/usr/bin/supervisord -c "/etc/supervisor/conf.d/supervisord.conf"