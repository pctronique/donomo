#!/bin/bash

if [ -z ${MONGO_FOLDER_LOG} ]
then
    MONGO_FOLDER_LOG="/var/log/docker/mongo/"
fi

/var/docker/mongo/import.sh 2>> ${MONGO_FOLDER_LOG}installdatasgbd.log &

exec "$@"