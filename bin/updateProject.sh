while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install"
