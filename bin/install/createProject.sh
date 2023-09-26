#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

if ! ${0%/*}/in_install.sh ; then
  exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install cookie-session" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express-session" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express-socket.io-session" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install mongodb" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install morgan" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install nodemailer" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install object-hash" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install serve-favicon" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install serve-static" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install socket.io" ; then
    exit 1
fi
if ! docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install" ; then
    exit 1
fi

exit 0
