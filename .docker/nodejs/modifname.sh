#!/bin/bash
FILE_CONFIG="/var/docker/nodejs/package.json"

sed -i "s/name_project/$1/" $FILE_CONFIG
sed -i "s/file_server/$2/" $FILE_CONFIG

exit 0
