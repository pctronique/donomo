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

cd ${0%/*}/../../
if ! docker compose up -d ; then
  exit 1
fi

exit 0
