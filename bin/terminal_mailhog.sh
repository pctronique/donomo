#!/bin/bash
while read line  
do   
    if [ ! -z "$line" ]
    then
        export $line
    fi
done < ${0%/*}/../.env
docker exec -it ${NAME_PROJECT}_mailhog bash
