#!/bin/bash

/var/docker/nodejs/createProject.sh 2>> /var/log/docker/nodejs/initnodejs.log

/var/docker/nodejs/importdata.sh 2>> /var/log/docker/nodejs/installdata.log

exec "$@"