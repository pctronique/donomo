#!/bin/bash
if [ ! -e /home/project/www/package.json ]
then
  cp /var/docker/nodejs/package.json /home/project/www/package.json

  cd /home/project/www/

  if [ -e /var/docker/nodejs/packages_install.list ]
  then
    while read line  
    do   
      if [ ! -z "$line" ]
      then
        npm install $line
      fi
    done < /var/docker/nodejs/packages_install.list
  fi
fi

RUN npm install

service startserver start && tail -F /var/docker/nodejs/error.log

exit 0
