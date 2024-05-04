# variable environnement
ARG VALUE_PHP_VERSION
ARG DEF_PHP_VERSION=${VALUE_PHP_VERSION}

# config install nodejs
FROM node:latest

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

VOLUME "/home/project"
WORKDIR "/home/project"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends pm2 -g
RUN pm2 install pm2-logrotate

CMD service startserver start && tail -F /var/log/nodejs/error.log
