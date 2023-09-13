mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/mongo_data

chmod 777 -R project
chmod 777 -R projecttmp

# creation du fichier .env
if [ -e .env ]
then
    echo ""
else
    echo ""
    cp .env.example .env
fi

docker-compose up -d

./bin/npm.sh install
./bin/pm2.sh start server.js --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
