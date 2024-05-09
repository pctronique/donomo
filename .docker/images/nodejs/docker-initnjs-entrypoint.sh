#!/bin/bash

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

echo "end construct" >> ${NODE_FOLDER_LOG}endconstruct.log

/var/docker/nodejs/importdata.sh 2>> ${NODE_FOLDER_LOG}installdata.log

crontab /etc/cron.d/dockercron

touch ${NODE_FOLDER_LOG}cron.log
cron && tail -f ${NODE_FOLDER_LOG}cron.log &

/var/docker/nodejs/createProject.sh 2>> ${NODE_FOLDER_LOG}initnodejs.log

exec "$@"