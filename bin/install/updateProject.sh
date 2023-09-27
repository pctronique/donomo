#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   if [ ! -z "$line" ]
   then
      export $line
   fi
done < ${0%/*}/../../.env

if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT && npm install" ; then
    exit 1
fi

exit 0
