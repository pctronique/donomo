#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env
docker exec $NAME_SGBD_CONTAINER bash -c "cd /mongo-seed && ./import.sh"

exit 0
