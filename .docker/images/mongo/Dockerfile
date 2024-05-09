# variable environnement
ARG VALUE_MONGO_VERSION
ARG DEF_MONGO_VERSION=${VALUE_MONGO_VERSION:-7.0.9}

# config install nodejs
FROM mongo:${DEF_MONGO_VERSION}

ENV MONGO_FOLDER_INIT="/var/docker/mongo/"
ENV MONGO_FOLDER_LOG="/var/log/docker/mongo/"
ENV MONGO_FOLDER_SGBD="/data/db/"
ENV MONGO_FOLDER_IMPORT_SGBD="/docker-entrypoint-initdb.d/"

RUN mkdir -p ${MONGO_FOLDER_INIT}
RUN mkdir -p ${MONGO_FOLDER_LOG}

COPY import.sh ${MONGO_FOLDER_INIT}
RUN chmod +x ${MONGO_FOLDER_INIT}import.sh

COPY docker-datasgbd-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-datasgbd-entrypoint.sh

ENTRYPOINT ["docker-datasgbd-entrypoint.sh", "docker-entrypoint.sh"]

CMD ["mongod"]
