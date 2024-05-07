#!/bin/bash

while read line  
do   
    line="$line" | xargs
    if [[ ! $line =~ ^# ]];
    then
        if [ ! -z "$line" ]
        then
            value=${line#*=}
            name=${line%=*}
            export $name="$value"
        fi
    fi
done < ${0%/*}/.env

cd /home/project/www
pm2 $@ $NAME_JS_SERVER --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z" -o /var/log/docker/nodejs/nodejs_out.log -e /var/log/docker/nodejs/nodejs_err.log
