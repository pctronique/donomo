FROM node:latest

VOLUME "/home/project"
WORKDIR "/home/project"

RUN npm install -y --no-install-recommends pm2 -g
RUN npm install -y --no-install-recommends pm2-logrotate
