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

VOLUME "/tmp/project"
WORKDIR "/tmp/project"

COPY modifname.sh /tmp/project/
COPY createProject.sh /tmp/project/
COPY packages_install.list /tmp/project/
COPY package.json /tmp/project/

RUN /tmp/project/modifname.sh "${DEF_NAME_PROJECT}" "${DEF_NAME_JS_SERVER}"

VOLUME "/home/project"
WORKDIR "/home/project"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends pm2 -g
RUN pm2 install pm2-logrotate

CMD service startserver start && tail -F /var/log/nodejs/error.log
