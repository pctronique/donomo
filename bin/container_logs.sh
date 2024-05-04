#!/bin/bash
if ! ${0%/*}/install/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
    if [ ! -z "$line" ]
    then
        export $line
    fi
done < ${0%/*}/../.env

option=$1
if [[ "$option" = "" ]]
then
    option="--helps"
fi

if [[ "$option" = "--helps" ]]
then
    echo "Vous pouvez choissir d'afficher le log d'un conteneur avec la commande : $ ./container_logs.sh [option]"
    echo "Options:"
    echo "   --nodejs"
    echo "   --mongo"
    echo "   --mongo-express"
    echo "   --mailhog"
    echo "   --helps"
    echo "   [id ou nom du conteneur]"
else
    container=$1
    case "$container" in
        --nodejs)
            container=$NAME_PROJECT_CONTAINER
            ;;
    
        --mongo)
            container=$NAME_SGBD_CONTAINER
            ;;

        --mongo-express)
            container=$NAME_SGBD_DISPLAY_CONTAINER
            ;;

        --mailhog)
            container=$NAME_MAIL_DISPLAY_CONTAINER
            ;;
    esac

    docker logs --details $container

fi

exit 0
