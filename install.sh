./bin/install/start_install.sh

#./bin/install/message.sh

if [ ! -e .env ]
then
    exit 1
fi

mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/pm2
mkdir -p projecttmp/tmp
mkdir -p projecttmp/tmp/nodejs
mkdir -p projecttmp/mongo_data
mkdir -p projecttmp/projecttmp/logs/nodejs

chmod 777 -R project
chmod 777 -R projecttmp

 # creation du fichier package.json
if [ ! -e project/www/package.json ]
then
    cp .docker/config/package.json project/www/package.json
fi

# creation du docker du projet
if docker-compose up --build -d ; then
    ./bin/import_sgbd.sh

    ./bin/createProject.sh
    ./bin/npm.sh install
    ./start.sh
fi
