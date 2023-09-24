#!/bin/bash
if ! ${0%/*}/install/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../.env

d_start () {
   docker container start $NAME_PROJECT_CONTAINER
}

d_stop () {
   docker container stop $NAME_PROJECT_CONTAINER
}
 
d_restart () {
   d_stop
   d_start
}

option=$1
if [[ "$option" = "" ]]
then
    option="--helps"
fi

case "$1" in
   start|stop)
      d_${1}
      exit 0
      ;;
   
   restart|reload)
      d_restart
      exit 0
      ;;
   
   *)
      echo "$ .server.sh [option]"
      echo "Options:"
      echo "   start      : Pour démarrer le serveur."
      echo "   stop       : Pour arrêter le serveur."
      echo "   restart    : Pour redémarrer le serveur."
      echo "   reload     : Pour redémarrer le serveur."
      echo "   --helps    : Pour afficher l'aide."
      exit 0
      ;;

   esac
fi
