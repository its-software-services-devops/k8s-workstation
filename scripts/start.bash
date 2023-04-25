#!/bin/sh

echo "${DEFAULT_USER}:${DEFAULT_PASSWORD}" | chpasswd

/usr/bin/supervisord -c "/etc/supervisor/conf.d/supervisord.conf"
