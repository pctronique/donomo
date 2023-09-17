while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_SGBD_CONTAINER bash -c "cd /mongo-seed && ./import.sh"
