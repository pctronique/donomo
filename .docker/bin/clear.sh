#!/bin/bash
sudo service openvpn stop
sudo docker network prune -f
sudo service openvpn stop

sudo docker stop $(docker ps -aq) && sudo docker rm $(docker ps -aq) && sudo docker rmi -f $(docker images -q)

docker image prune
docker container prune
docker image prune -a
sudo docker image prune
sudo docker container prune
sudo docker image prune -a

sudo service docker stop
sudo rm -r /var/lib/docker/overlay2
sudo service docker start
sudo docker system prune --volumes -a
