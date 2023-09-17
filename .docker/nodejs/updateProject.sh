cd /home/project/
pm2 $@ server.js --watch --merge-logs --log-date-format="YYYY-MM-DD HH:mm Z"
