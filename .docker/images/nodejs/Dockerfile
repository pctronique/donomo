# variable environnement
ARG VALUE_NODEJS_VERSION
ARG DEF_NODEJS_VERSION=${VALUE_NODEJS_VERSION:-"22.1.0"}

# config install nodejs
FROM node:${DEF_NODEJS_VERSION}

ENV NODE_FOLDER_PROJECT="/home/project/www/"
ENV NODE_FOLDER_LOG="/var/log/docker/nodejs/"
ENV NODE_FOLDER_TMP="/var/tmp/docker/nodejs/"
ENV NODE_FOLDER_INIT="/var/docker/nodejs/"
ENV NODE_FOLDER_INIT_DATA="/docker-entrypoint-initdata.d/"

ARG VALUE_NODEJS_VERSION
ENV DEF_NODEJSX_VERSION=${VALUE_NODEJS_VERSION}


ENV DEF_NODEJSPM2_VERSION=${VALUE_NODEJS_VERSION:-"5.3.1"}
ENV DEF_NODEJSPM2_VERSION=${DEF_NODEJSPM2_VERSION##${DEF_NODEJSX_VERSION}}
ARG VALUE_PM2_VERSION
ENV DEF_PM2_VERSION=${DEF_NODEJSPM2_VERSION:-"${VALUE_PM2_VERSION}"}
ENV PM2_VERSION=${DEF_PM2_VERSION:+"pm2@${DEF_PM2_VERSION}"}
ENV PM2_VERSION=${PM2_VERSION:-'pm2'}

ENV DEF_NODEJSPM2LR_VERSION=${VALUE_NODEJS_VERSION:-"2.7.0"}
ENV DEF_NODEJSPM2LR_VERSION=${DEF_NODEJSPM2LR_VERSION##${DEF_NODEJSX_VERSION}}
ARG VALUE_PM2ROTATE_VERSION
ENV DEF_PM2LR_VERSION=${DEF_NODEJSPM2LR_VERSION:-"${VALUE_PM2ROTATE_VERSION}"}
ENV PM2LR_VERSION=${DEF_PM2LR_VERSION:+"pm2-logrotate@${DEF_PM2LR_VERSION}"}
ENV PM2LR_VERSION=${PM2LR_VERSION:-'pm2-logrotate'}

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y cron
RUN apt-get install -y inotify-tools
#del list
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${NODE_FOLDER_INIT}
RUN mkdir -p ${NODE_FOLDER_PROJECT}
RUN mkdir -p ${NODE_FOLDER_LOG}
RUN mkdir -p ${NODE_FOLDER_INIT_DATA}
RUN mkdir -p ${NODE_FOLDER_TMP}

COPY modifname.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}/modifname.sh

COPY createProject.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}/createProject.sh

COPY packages_install.list ${NODE_FOLDER_INIT}
COPY package.json ${NODE_FOLDER_INIT}
#COPY ecosystem.config.js ${NODE_FOLDER_INIT}

COPY importdata.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}/importdata.sh

COPY updateProject.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}/updateProject.sh

COPY dockercron ${NODE_FOLDER_INIT}
COPY dockercron /etc/cron.d/dockercron
RUN crontab /etc/cron.d/dockercron

COPY cronauto.sh ${NODE_FOLDER_INIT}
RUN chmod +x ${NODE_FOLDER_INIT}/cronauto.sh

COPY docker-initnjs-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-initnjs-entrypoint.sh

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends ${PM2_VERSION} -g
RUN pm2 install ${PM2LR_VERSION}

RUN touch ${NODE_FOLDER_LOG}/error.log

ENTRYPOINT ["docker-entrypoint.sh", "docker-initnjs-entrypoint.sh"]

VOLUME "${NODE_FOLDER_PROJECT}"
WORKDIR "${NODE_FOLDER_PROJECT}"

CMD [ "node" ]
