#! /bin/bash

rm -rf /base_backup/old /base_backup/new

pg_basebackup -U postgres -D /base_backup/new

mv /base_backup/latest /base_backup/old
mv /base_backup/new /base_backup/latest
rm -rf /base_backup/old
