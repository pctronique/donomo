#!/bin/bash
FOLDER_BASE="${0%/*}/../.."
FICHIER_ENV_EXA="$FOLDER_BASE/.env.example"
FILE_CONFIG="$FOLDER_BASE/config"
FILE_DATA="$FILE_CONFIG/sgbd_data"

if [ ! -e $FICHIER_ENV_EXA ]
then
    echo "Il manque le fichier '.env.example'."
    exit 1
fi

while read line  
do   
   export $line
done < $FICHIER_ENV_EXA

sed -i "s/dbname/$SGBD_DATABASE/" $FILE_CONFIG/connection_mongo.json

exit 0
