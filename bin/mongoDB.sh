while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec -t $NAME_SGBD_CONTAINER mongodb "$@"
