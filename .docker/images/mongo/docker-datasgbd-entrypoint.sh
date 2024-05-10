#!/bin/bash

if [ -z ${MONGO_FOLDER_LOG} ]
then
    MONGO_FOLDER_LOG="/var/log/docker/mongo/"
fi

if [ -z ${MONGO_FOLDER_INIT} ]
then
    MONGO_FOLDER_INIT="/var/docker/mongo/"
fi

${MONGO_FOLDER_INIT}import.sh 2>> ${MONGO_FOLDER_LOG}installdatasgbd.log &

exec "$@"