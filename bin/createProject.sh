while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install cookie-session"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install express"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install express-session"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install express-socket.io-session"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install mongodb"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install morgan"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install nodemailer"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install object-hash"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install serve-favicon"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install serve-static"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install socket.io"
docker exec $NAME_NODEJS_CONTAINER bash -c "cd $FOLDER_PROJECT_NODEJS && npm install"
