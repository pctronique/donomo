#!/bin/bash
if [ ! -f "${0%/*}/../../.env" ]
then
  echo "Il manque le fichier .env"
  exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

cd ${0%/*}/../../
docker-compose up -d

exit 0
