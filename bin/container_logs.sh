while read line  
do   
   export $line
done < ${0%/*}/../.env

option=$1
if [[ "$option" = "" ]]
then
    option="--helps"
fi

if [[ "$option" = "--helps" ]]
then
    echo "Options:"
    echo "   --nodejs"
    echo "   --mongo"
    echo "   --mongo-express"
    echo "   --mailhog"
    echo "   --helps"
    echo "   [id ou nom du conteneur]"
else
    container=$@
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
