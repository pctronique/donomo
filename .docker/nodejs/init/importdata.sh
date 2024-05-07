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
done < /var/docker/nodejs/.env

if [ -d "/var/docker/nodejs/data" ]; then
    if [ ! -d "/home/project/www/$FOLDER_DATA" ]; then
        mkdir -p "/home/project/www/$FOLDER_DATA"
        cp -r /var/docker/nodejs/data/* "/home/project/www/$FOLDER_DATA/"
    fi
fi

exit 0
