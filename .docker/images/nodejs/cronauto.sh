#!/bin/bash

while : ;
do
    test2=$(diff -u /var/docker/nodejs/dockercron /etc/cron.d/dockercron)
    if [ ! -z "${test2}" ]
    then
        cp /var/docker/nodejs/dockercron /etc/cron.d/dockercron
        crontab /etc/cron.d/dockercron
    fi
done
