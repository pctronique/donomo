#!/bin/bash

/var/docker/mongo/import.sh 2>> ${MONGO_FOLDER_LOG}installdatasgbd.log

exec "$@"