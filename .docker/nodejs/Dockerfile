# variable environnement
ARG VALUE_NODEJS_VERSION
ARG DEF_NODEJS_VERSION=${VALUE_NODEJS_VERSION}

# config install nodejs
FROM node:${DEF_NODEJS_VERSION}

# variable version (environnement)
ARG NAME_PROJECT
ENV DEF_NAME_PROJECT=${NAME_PROJECT}
ARG NAME_JS_SERVER
ENV DEF_NAME_JS_SERVER=${NAME_JS_SERVER}

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

VOLUME "/var/docker/nodejs"

COPY modifname.sh /var/docker/nodejs/
COPY createProject.sh /var/docker/nodejs/
COPY packages_install.list /var/docker/nodejs/
COPY package.json /var/docker/nodejs/

RUN /var/docker/nodejs/modifname.sh "${DEF_NAME_PROJECT}" "${DEF_NAME_JS_SERVER}"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends pm2 -g
RUN pm2 install pm2-logrotate

VOLUME "/home/project/www"
WORKDIR "/home/project/www"

CMD service startserver start && tail -F /var/log/nodejs/error.log
