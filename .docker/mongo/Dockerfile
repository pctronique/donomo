# variable environnement
ARG VALUE_MONGO_VERSION
ARG DEF_MONGO_VERSION=${VALUE_MONGO_VERSION}

# config install nodejs
FROM mongo:${DEF_MONGO_VERSION}

RUN mkdir -p /var/docker/mongo
RUN mkdir -p /var/log/docker/mongo

COPY init/import.sh /var/docker/mongo/
RUN chmod +x /var/docker/mongo/import.sh

COPY init/docker-datasgbd-entrypoint.sh /var/docker/mongo/
RUN chmod +x /var/docker/mongo/docker-datasgbd-entrypoint.sh

#ENTRYPOINT ["/var/docker/mongo/docker-datasgbd-entrypoint.sh"]
