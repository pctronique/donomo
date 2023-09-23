#!/bin/bash
FOLDER_BASE="${0%/*}/../.."
FICHIER_ENV_EXA="$FOLDER_BASE/.env.example"

if [ ! -e $FICHIER_ENV_EXA ]
then
    echo "Il manque le fichier '.env.example'."
    exit 1
fi

while read line  
do   
   export $line
done < $FICHIER_ENV_EXA

FILE_CONFIG="$FOLDER_BASE/project/$FOLDER_PROJECT/package.json"

sed -i "s/\"name\": \"nameproject\"/\"name\": \"$NAME_PROJECT\"/" $FILE_CONFIG
sed -i "s/nameserverjs/$NAME_JS_SERVER/" $FILE_CONFIG

exit 0
