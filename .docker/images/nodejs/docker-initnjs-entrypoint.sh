#!/bin/bash

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${CRON_FOLDER_INIT} ]
then
    CRON_FOLDER_INIT="/var/docker/cron/"
fi

if [ -z ${IS_MODIF_NAME} ]
then
    IS_MODIF_NAME="YES"
fi

${NODE_FOLDER_INIT}/importdata.sh 2>> ${NODE_FOLDER_LOG}/installdata.log

cp ${CRON_FOLDER_INIT}/dockercron /etc/cron.d/dockercron

crontab /etc/cron.d/dockercron

#while inotifywait -e modify /etc/cron.d/dockercron; do crontab /etc/cron.d/dockercron; done &

#while inotifywait -e modify /etc/cron.d/dockercron; do crontab /etc/cron.d/dockercron; done &

touch ${NODE_FOLDER_LOG}/cron.log
cron && tail -f ${NODE_FOLDER_LOG}/cron.log &

crontab /etc/cron.d/dockercron

${CRON_FOLDER_INIT}/cronauto.sh 2>> ${NODE_FOLDER_LOG}/initnodejs.log &

${NODE_FOLDER_INIT}/createProject.sh 2>> ${NODE_FOLDER_LOG}/initnodejs.log

if [ "${IS_MODIF_NAME}" == "YES" ]
then
    ${NODE_FOLDER_INIT}/modifname.sh 2>> ${NODE_FOLDER_LOG}/initnodejs.log
fi

echo "end create project" >> ${NODE_FOLDER_LOG}/endcreate.log

exec "$@"
