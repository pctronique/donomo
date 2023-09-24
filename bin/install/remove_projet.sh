#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

FOLDER_BASE="${0%/*}/../.."
FOLDER_DOCKER="$FOLDER_BASE/.docker"
FOLDER_DOCKER_CONF="$FOLDER_DOCKER/config"
FOLDER_ENV_DEF="$FOLDER_DOCKER/file_env"

while read line  
do   
   export $line
done < "$FOLDER_BASE/.env"

while read line  
do   
   export $line
done < "$FOLDER_ENV_DEF/.env"

rm -f -r "$FOLDER_DOCKER/$DOCKER_FOLDER_PROJECT/Dockerfile"
rm -f -r "$FOLDER_BASE/docker-compose.yml"
rm -f -r "$FOLDER_BASE/project/$FOLDER_PROJECT/package.json"
$FOLDER_BASE/bin/gitignore.sh
rm -f -r "$FOLDER_BASE/.env"
rm -f -r "$FOLDER_BASE/.env.example"
rm -f -r "$FOLDER_BASE/config"

exit 0
