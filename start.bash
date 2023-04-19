#!/bin/bash

usermod --password ${SSH_PASSWORD} ${SSH_USER}

/usr/bin/supervisord -c "/etc/supervisor/conf.d/supervisord.conf"