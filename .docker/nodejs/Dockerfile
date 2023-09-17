FROM node:latest

VOLUME "/home/project"
WORKDIR "/home/project"

#COPY startserver /etc/init.d/
#COPY updateProject.sh /home

#RUN chmod +x /etc/init.d/startserver
#RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends pm2 -g
RUN npm install -y --no-install-recommends pm2-logrotate

RUN npm install -y --no-install-recommends pm2-logrotate

RUN updateProject.sh &

#RUN /etc/init.d/startserver start
