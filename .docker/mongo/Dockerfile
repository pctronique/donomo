# variable environnement
ARG VALUE_SGBD_VERSION
ARG DEF_SGBD_VERSION=${VALUE_SGBD_VERSION}

# config install nodejs
FROM mongo:${DEF_SGBD_VERSION}

COPY import_sgbd.sh /var/sgbd/mongo/

RUN chmod +x /var/sgbd/mongo/import_sgbd.sh
RUN /var/sgbd/mongo/import_sgbd.sh &
