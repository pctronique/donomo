mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/pm2
mkdir -p projecttmp/tmp
mkdir -p projecttmp/tmp/nodejs
mkdir -p projecttmp/mongo_data
mkdir -p projecttmp/mongo-seed

chmod 777 -R project
chmod 777 -R projecttmp


 # creation du fichier package.json
if [ ! -e project/package.json ]
then
    cp .docker/config/package.json project/package.json
fi

# creation du fichier .env
if [ ! -e .env ]
then
    cp .env.example .env
fi

docker-compose up -d

./bin/import_sgbd.sh

./bin/createProject.sh
./bin/npm.sh install
./start.sh
