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

RUN groupadd docker

RUN mkdir -p /var/docker/nodejs
RUN mkdir -p /var/log/docker/nodejs/

COPY init/modifname.sh /var/docker/nodejs/
RUN chmod +x /var/docker/nodejs/modifname.sh

COPY init/createProject.sh /var/docker/nodejs/
RUN chmod +x /var/docker/nodejs/createProject.sh

COPY init/packages_install.list /var/docker/nodejs/
COPY init/package.json /var/docker/nodejs/

COPY init/importdata.sh /var/docker/nodejs/
RUN chmod +x /var/docker/nodejs/importdata.sh

COPY init/updateProject.sh /var/docker/nodejs/
RUN chmod +x /var/docker/nodejs/updateProject.sh

COPY init/docker-initnjs-entrypoint.sh /var/docker/nodejs/
RUN chmod +x /var/docker/nodejs/docker-initnjs-entrypoint.sh

RUN /var/docker/nodejs/modifname.sh "${DEF_NAME_PROJECT}" "${DEF_NAME_JS_SERVER}"

COPY init/startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN npm install -y --no-install-recommends pm2 -g
RUN pm2 install pm2-logrotate

ENTRYPOINT ["/var/docker/nodejs/docker-initnjs-entrypoint.sh"]

VOLUME "/home/project/www"
WORKDIR "/home/project/www"

CMD service startserver start && tail -F /var/docker/nodejs/error.log
