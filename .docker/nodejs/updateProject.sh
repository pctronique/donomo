echo "0001" >> home/projecttmp/tmp/nodejs/test.log
cd /home/project/
pm2 start server.js --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
