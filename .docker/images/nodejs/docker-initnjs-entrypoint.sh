#!/bin/bash

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

/var/docker/nodejs/importdata.sh 2>> ${NODE_FOLDER_LOG}installdata.log

/var/docker/nodejs/createProject.sh 2>> ${NODE_FOLDER_LOG}initnodejs.log

echo "end construct" >> ${NODE_FOLDER_LOG}endconstruct.log

exec "$@"