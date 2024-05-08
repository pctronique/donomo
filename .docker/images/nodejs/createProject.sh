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

if [ ! -e ${NODE_FOLDER_PROJECT}ecosystem.config.js ]
then
  cp ${NODE_FOLDER_INIT}ecosystem.config.js ${NODE_FOLDER_PROJECT}ecosystem.config.js
fi

if [ ! -e ${NODE_FOLDER_PROJECT}ecosystem.config.js.example ]
then
  cp ${NODE_FOLDER_INIT}ecosystem.config.js ${NODE_FOLDER_PROJECT}ecosystem.config.js.example
fi

if [ ! -e ${NODE_FOLDER_PROJECT}package.json ]
then
  cp ${NODE_FOLDER_INIT}package.json ${NODE_FOLDER_PROJECT}package.json

  cd ${NODE_FOLDER_PROJECT}

  if [ -e ${NODE_FOLDER_INIT}packages_install.list ]
  then
    while read line  
    do   
      if [ ! -z "$line" ]
      then
        npm install $line 2&>> ${NODE_FOLDER_LOG}initnodejs.log
      fi
    done < ${NODE_FOLDER_INIT}packages_install.list
  fi
fi

npm install 2&>> ${NODE_FOLDER_LOG}initnodejs.log

echo "" >> ${NODE_FOLDER_LOG}error.log

service startserver start && tail -F ${NODE_FOLDER_LOG}error.log

exit 0
