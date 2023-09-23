#! /bin/bash
while read line  
do   
   export $line
done < ${0%/*}/.env
for entry in `ls *.json`; do
    mongoimport -u=$SGBD_ROOT_USERNAME -p=$SGBD_ROOT_PASSWORD -h=mongo --authenticationDatabase=admin --db $SGBD_DATABASE --type json --file /mongo-seed/$entry --jsonArray
done
