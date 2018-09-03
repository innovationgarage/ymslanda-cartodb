FROM sverhoeven/cartodb

RUN echo "host all all 0.0.0.0/0 password" >> /etc/postgresql/10/main/pg_hba.conf 
RUN echo "listen_addresses = '*'" >> /etc/postgresql/10/main/postgresql.conf
RUN echo temp_tablespaces = 'temp' >> /etc/postgresql/10/main/postgresql.conf

# Create directory for tablespace created with
# CREATE TABLESPACE temp LOCATION '/tmp/postgresql' WITH (seq_page_cost = 1, random_page_cost = 1, effective_io_concurrency = 10);
RUN mkdir -p /tmp/postgresql/PG_10_201707211/
RUN chown postgres:postgres -R /tmp/postgresql
