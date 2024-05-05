#!/bin/bash
if ! /home/project/www/package.json ; then

  cp /tmp/project/package.json /home/project/www/package.json

  cd /home/project/www/

  if [ -e /tmp/project/packages_install.list ]
  then
    while read line  
    do   
      if [ ! -z "$line" ]
      then
        npm install $line
      fi
    done < /tmp/project/packages_install.list
  fi
fi

RUN npm install

service startserver start && tail -F /var/log/nodejs/error.log

exit 0
