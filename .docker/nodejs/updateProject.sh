#!/bin/bash
while read line  
do   
   if [ ! -z "$line" ]
   then
      export $line
   fi
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT
pm2 $@ $NAME_JS_SERVER --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
