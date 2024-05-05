FROM mongo:7.0.9
ENV MONGO_INITDB_ROOT_USERNAME root
ENV MONGO_INITDB_ROOT_PASSWORD root
ENV MONGO_INITDB_DATABASE testdb

COPY import_sgbd.sh /var/sgbd/mongo/
COPY testboucle.sh /var/sgbd/mongo/
#RUN /var/sgbd/mongo/import_sgbd.sh
RUN chmod 777 /var/sgbd/mongo/testboucle.sh
RUN /var/sgbd/mongo/testboucle.sh &
