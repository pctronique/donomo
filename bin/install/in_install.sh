#!/bin/bash

while read line  
do   
   export $line
done < ${0%/*}/../../.env

cp ${0%/*}/../../.docker/config/.gitignore ${0%/*}/../../project/www/.gitignore

PACK_JSON_LINE1="$FOLDER_PROJECT"
PACK_JSON_LINE1_REPLACE="$NAME_PROJECT"
PACK_JSON_FILE="${0%/*}/../../project/$FOLDER_PROJECT/package.json"
sed -i "s/$PACK_JSON_LINE1/$PACK_JSON_LINE1_REPLACE/" $PACK_JSON_FILE

cd ${0%/*}/../../
docker-compose up -d
