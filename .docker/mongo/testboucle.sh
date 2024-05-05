#! /bin/bash
echo "error01" >> "/var/log/defmongo/error02.log"
while [ ! -f /mongo-seed/import.sh ]
do
  echo "error" >> "/var/log/defmongo/error02.log"
  sleep 2 # or less like 0.2
done

/mongo-seed/import.sh 2&> "/var/log/defmongo/error.log"