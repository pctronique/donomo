#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install" ; then
    exit 1
fi

exit 0
