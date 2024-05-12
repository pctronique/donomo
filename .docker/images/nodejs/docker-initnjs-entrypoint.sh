#!/bin/bash

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

${NODE_FOLDER_INIT}/importdata.sh 2>> ${NODE_FOLDER_LOG}/installdata.log

crontab /etc/cron.d/dockercron
while inotifywait -e close_write /etc/cron.d/dockercron; do crontab /etc/cron.d/dockercron; done &

touch ${NODE_FOLDER_LOG}/cron.log
cron && tail -f ${NODE_FOLDER_LOG}/cron.log &

${NODE_FOLDER_INIT}/createProject.sh 2>> ${NODE_FOLDER_LOG}/initnodejs.log

${NODE_FOLDER_INIT}/modifname.sh 2>> ${NODE_FOLDER_LOG}/initnodejs.log

echo "end create project" >> ${NODE_FOLDER_LOG}/endcreate.log

exec "$@"
