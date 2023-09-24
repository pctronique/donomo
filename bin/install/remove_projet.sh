#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

FOLDER_BASE="${0%/*}/../.."

while read line  
do   
   export $line
done < "$FOLDER_BASE/.env"

rm -f -r "$FOLDER_BASE/project/$FOLDER_PROJECT/package.json"
$FOLDER_BASE/bin/gitignore.sh
rm -f -r "$FOLDER_BASE/.env"
rm -f -r "$FOLDER_BASE/.env.example"
rm -f -r "$FOLDER_BASE/config"

exit 0
