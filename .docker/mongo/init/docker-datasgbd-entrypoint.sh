#!/bin/bash

/var/docker/mongo/import.sh 2>> /var/log/docker/mongo/installdatasgbd.log

exec "$@"