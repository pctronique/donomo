#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_FOLDER_DATA} ]
then
    NODE_FOLDER_DATA=data
fi

if [ -z ${NODE_FOLDER_INIT_DATA} ]
then
    NODE_FOLDER_INIT_DATA=/docker-entrypoint-initdata.d/
fi

if [ ! -d "${NODE_FOLDER_PROJECT}/${NODE_FOLDER_DATA}" ]; then
    if [ ! -z "$(ls -A ${NODE_FOLDER_INIT_DATA})" ]; then
        mkdir -p "${NODE_FOLDER_PROJECT}/${NODE_FOLDER_DATA}" 2>> ${NODE_FOLDER_LOG}/installdata.log
        cp -r ${NODE_FOLDER_INIT_DATA}* "${NODE_FOLDER_PROJECT}/${NODE_FOLDER_DATA}/" 2>> ${NODE_FOLDER_LOG}/installdata.log
        chmod 777 -R "${NODE_FOLDER_PROJECT}/${NODE_FOLDER_DATA}"
    fi
fi

exit 0
