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

if [ ! -e ${NODE_FOLDER_PROJECT}/package.json ] && [ ! -e ${NODE_FOLDER_PROJECT}/package.json.example ]
then
  cp ${NODE_FOLDER_INIT}/package.json ${NODE_FOLDER_PROJECT}/package.json

  cd ${NODE_FOLDER_PROJECT}

  if [ -e ${NODE_FOLDER_INIT}/packages_install.list ]
  then
    while read line  
    do   
      if [ ! -z "$line" ]
      then
        npm install $line 2&>> ${NODE_FOLDER_LOG}/initnodejs.log
      fi
    done < ${NODE_FOLDER_INIT}/packages_install.list
  fi

  cp ${NODE_FOLDER_PROJECT}/package.json ${NODE_FOLDER_PROJECT}/package.json.example

fi

if [ ! -e ${NODE_FOLDER_PROJECT}/package.json ] && [ -e ${NODE_FOLDER_PROJECT}/package.json.example ]
then

  cp ${NODE_FOLDER_PROJECT}/package.json.example ${NODE_FOLDER_PROJECT}/package.json

fi

npm install 2&>> ${NODE_FOLDER_LOG}/initnodejs.log

touch ${NODE_FOLDER_LOG}/error.log

service startserver start && tail -F ${NODE_FOLDER_LOG}/error.log &

exit 0
