while read line  
do   
   export $line
done < ${0%/*}/../.env
${0%/*}/install/in_install.sh
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install cookie-session"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express-session"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install express-socket.io-session"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install mongodb"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install morgan"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install nodemailer"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install object-hash"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install serve-favicon"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install serve-static"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install socket.io"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && npm install"
