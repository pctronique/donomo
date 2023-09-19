while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec -it $NAME_NODEJS_CONTAINER npm install cookie-session
docker exec -it $NAME_NODEJS_CONTAINER npm install express
docker exec -it $NAME_NODEJS_CONTAINER npm install express-session
docker exec -it $NAME_NODEJS_CONTAINER npm install express-socket.io-session
docker exec -it $NAME_NODEJS_CONTAINER npm install mongodb
docker exec -it $NAME_NODEJS_CONTAINER npm install morgan
docker exec -it $NAME_NODEJS_CONTAINER npm install nodemailer
docker exec -it $NAME_NODEJS_CONTAINER npm install object-hash
docker exec -it $NAME_NODEJS_CONTAINER npm install serve-favicon
docker exec -it $NAME_NODEJS_CONTAINER npm install serve-static
docker exec -it $NAME_NODEJS_CONTAINER npm install socket.io
