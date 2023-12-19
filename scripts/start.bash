#!/bin/sh

CFG_FILE=/etc/supervisor/conf.d/supervisord-noproxy.conf

if [ "${USE_TOR_PROXY}" == "YES" ]
then
    CFG_FILE=/etc/supervisor/conf.d/supervisord.conf
fi

/usr/bin/supervisord -c "${CFG_FILE}"
