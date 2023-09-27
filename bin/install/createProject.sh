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

if ! ${0%/*}/in_install.sh ; then
  exit 1
fi

if [ -e ${0%/*}/packages_install.list ]
then
  while read line  
  do   
    if [ ! -z "$line" ]
    then
      if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT/ && npm install $line" ; then
        exit 1
      fi
    fi
  done < ${0%/*}/packages_install.list
fi

if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT && npm install" ; then
    exit 1
fi

exit 0
