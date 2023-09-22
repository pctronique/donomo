while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT_NODEJS
pm2 $@ $NAME_JS_SERVER --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
