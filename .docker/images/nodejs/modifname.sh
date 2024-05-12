#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_FOLDER_INIT} ]
then
    NODE_FOLDER_INIT=/var/docker/nodejs/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

if [ -z ${NODE_NAME_SERVER} ]
then
    NODE_NAME_SERVER=${NODE_NAME_PROJECT}
fi

if [ -z ${NODE_NAME_JS_SERVER} ]
then
    NODE_NAME_JS_SERVER=server.js
fi

if [ -e ${NODE_FOLDER_PROJECT}/package.json ]
then
    sed -i "s/name_project/${NODE_NAME_PROJECT}/" "${NODE_FOLDER_PROJECT}/package.json"
    sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" "${NODE_FOLDER_PROJECT}/package.json"
fi

exit 0
