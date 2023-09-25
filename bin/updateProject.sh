#!/bin/bash
if ! ${0%/*}/install/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../.env

${0%/*}/server.sh restart

docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install"

${0%/*}/server.sh stop

exit 0
