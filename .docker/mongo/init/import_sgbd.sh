#! /bin/bash
while [ ! -f /mongo-seed/import.sh ]
do
  sleep 0.2
done

/mongo-seed/import.sh 2&> "/var/log/docker/mongo/error.log"