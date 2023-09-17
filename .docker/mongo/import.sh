#! /bin/bash
while read line  
do   
   export $line
done < ${0%/*}/.env
for entry in `ls *.json`; do
    mongoimport -u=$MONGO_ROOT_USERNAME -p=$MONGO_ROOT_PASSWORD -h=mongo --authenticationDatabase=admin --db $MONGO_DATABASE --type json --file /mongo-seed/$entry --jsonArray
done
