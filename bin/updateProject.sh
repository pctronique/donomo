while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install"
