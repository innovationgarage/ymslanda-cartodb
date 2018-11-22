FROM sverhoeven/cartodb

RUN apt update
RUN apt install -y rsync

ADD postgresql.conf /postgresql.conf
ADD recovery.conf /recovery.conf
ADD backup.sh /backup.sh
ADD startup.sh /startup.sh
ADD crontab /etc/cron.d/postgres-backup

RUN echo "host all all 0.0.0.0/0 password" >> /etc/postgresql/10/main/pg_hba.conf 
RUN cat /postgresql.conf >> /etc/postgresql/10/main/postgresql.conf

# Create directory for tablespace created with
# CREATE TABLESPACE temp LOCATION '/tmp/postgresql' WITH (seq_page_cost = 1, random_page_cost = 1, effective_io_concurrency = 10);
RUN mkdir -p /tmp/postgresql/PG_10_201707211/
RUN chown postgres:postgres -R /tmp/postgresql

HEALTHCHECK CMD true #  --start-period=30m CMD curl -f http://localhost || exit 1
CMD ["/bin/bash", "/startup.sh"]
