#! /bin/bash

mkdir -p /var/lib/postgresql/10/main/
rsync -a --delete --progress /base_backup/latest/ /var/lib/postgresql/10/main/
chown -R postgres:postgres /var/lib/postgresql/10/main/

mv /recovery.conf /var/lib/postgresql/10/main/recovery.conf
chown postgres /var/lib/postgresql/10/main/recovery.conf

service cron start

exec bash /opt/startup.sh
