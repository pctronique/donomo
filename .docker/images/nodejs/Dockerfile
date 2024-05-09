# variable environnement
ARG VALUE_NODEJS_VERSION
ARG DEF_NODEJS_VERSION=${VALUE_NODEJS_VERSION}

# config install nodejs
FROM node:${DEF_NODEJS_VERSION}

ENV NODE_FOLDER_PROJECT="/home/project/www/"
ENV NODE_FOLDER_LOG="/var/log/docker/nodejs/"
ENV NODE_FOLDER_TMP="/var/tmp/docker/nodejs/"
ENV NODE_FOLDER_INIT="/var/docker/nodejs/"
ENV NODE_FOLDER_INIT_DATA="/docker-entrypoint-initdata.d/"

ARG VALUE_PM2_VERSION
ENV DEF_PM2_VERSION=${VALUE_PM2_VERSION}
ENV PM2_VERSION=${DEF_PM2_VERSION:+"pm2@${DEF_PM2_VERSION}"}
ENV PM2_VERSION=${PM2_VERSION:-'pm2'}

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils
RUN apt install -y cron

RUN mkdir -p ${NODE_FOLDER_INIT}
RUN mkdir -p ${NODE_FOLDER_PROJECT}
RUN mkdir -p ${NODE_FOLDER_LOG}
RUN mkdir -p ${NODE_FOLDER_INIT_DATA}
RUN mkdir -p ${NODE_FOLDER_TMP}

COPY dockercron /etc/cron.d/dockercron
RUN crontab /etc/cron.d/dockercron

COPY modifname.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}modifname.sh

COPY createProject.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}createProject.sh

COPY packages_install.list ${NODE_FOLDER_INIT}
COPY package.json ${NODE_FOLDER_INIT}
COPY ecosystem.config.js ${NODE_FOLDER_INIT}

COPY importdata.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}importdata.sh

COPY updateProject.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}updateProject.sh

COPY docker-initnjs-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-initnjs-entrypoint.sh

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends ${PM2_VERSION} -g
#RUN pm2 install pm2-logrotate

RUN touch ${NODE_FOLDER_LOG}error.log

ENTRYPOINT ["docker-entrypoint.sh", "docker-initnjs-entrypoint.sh"]

VOLUME "${NODE_FOLDER_PROJECT}"
WORKDIR "${NODE_FOLDER_PROJECT}"

CMD [ "node" ]
