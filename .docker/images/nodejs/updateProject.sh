#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_NAME_JS_SERVER} ]
then
    NODE_NAME_JS_SERVER=server.js
fi

cd ${NODE_FOLDER_PROJECT}
pm2 $@ ${NODE_NAME_JS_SERVER} --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z" -o ${NODE_FOLDER_LOG}/nodejs_out.log -e ${NODE_FOLDER_LOG}/nodejs_err.log
