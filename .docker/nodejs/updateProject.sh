cd /home/project/
while [ ! -e server.js ]
do
   echo ""
done
pm2 start server.js --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
