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

FILE_PACKAGE="${NODE_FOLDER_INIT}package.json"
FILE_CONFIG="${NODE_FOLDER_INIT}ecosystem.config.js"

sed -i "s/name_project/${NODE_NAME_PROJECT}/" $FILE_PACKAGE
sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" $FILE_PACKAGE
sed -i "s/name_project/${NODE_NAME_SERVER}/" $FILE_CONFIG
sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" $FILE_CONFIG

if [ ! -e ${NODE_FOLDER_PROJECT}package.json ]
then
    if [ -e ${NODE_FOLDER_PROJECT}package.json.example ]
    then
        cp ${NODE_FOLDER_PROJECT}package.json.example ${NODE_FOLDER_PROJECT}package.json
    fi
fi

if [ -e ${NODE_FOLDER_PROJECT}package.json ]
then
    sed -i "s/name_project/${NODE_NAME_PROJECT}/" "${NODE_FOLDER_PROJECT}package.json"
    sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" "${NODE_FOLDER_PROJECT}package.json"
fi

if [ -e ${NODE_FOLDER_PROJECT}ecosystem.config.js ]
then
    sed -i "s/name_project/${NODE_NAME_SERVER}/" "${NODE_FOLDER_PROJECT}ecosystem.config.js"
    sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" "${NODE_FOLDER_PROJECT}ecosystem.config.js"
fi

if [ -e ${NODE_FOLDER_PROJECT}ecosystem.config.js.example ]
then
    sed -i "s/name_project/${NODE_NAME_SERVER}/" "${NODE_FOLDER_PROJECT}ecosystem.config.js.example"
    sed -i "s/file_server/${NODE_NAME_JS_SERVER}/" "${NODE_FOLDER_PROJECT}ecosystem.config.js.example"
fi

exit 0
