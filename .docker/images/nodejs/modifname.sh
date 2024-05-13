#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

if [ -z ${NODE_NAME_JS_SERVER} ]
then
    NODE_NAME_JS_SERVER=server.js
fi

VAR_NAME_DEF=$(sed -ne "0,/\\\"name\": \".*\",/s//\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_SERVER_DEF=$(sed -ne "0,/\\\"main\": \".*\",/s//\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_START_DEF="\"start\": \"node .*\""

VAR_NAME_REPL="\"name\": \"${NODE_NAME_PROJECT}\","
VAR_SERVER_REPL="\"main\": \"${NODE_NAME_JS_SERVER}\","
VAR_START_REPL="\"start\": \"node ${NODE_NAME_JS_SERVER}\""

if [ -e ${NODE_FOLDER_PROJECT}/package.json ]
then
  sed -i "s/${VAR_NAME_DEF}/${VAR_NAME_REPL}/" "${NODE_FOLDER_PROJECT}/package.json"
  sed -i "s/${VAR_SERVER_DEF}/${VAR_SERVER_REPL}/" "${NODE_FOLDER_PROJECT}/package.json"
  sed -i "s/${VAR_START_DEF}/${VAR_START_REPL}/" "${NODE_FOLDER_PROJECT}/package.json"
fi

exit 0
