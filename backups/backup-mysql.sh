#!/bin/sh

# GRANT USAGE ON *.* TO 'dump'@'%' IDENTIFIED BY ...;
# GRANT SELECT, LOCK TABLES ON `mysql`.* TO 'dump'@'%';
# GRANT SELECT, LOCK TABLES, SHOW VIEW, EVENT, TRIGGER ON `myschema`.* TO 'dump'@'%';

if [ -z "$BACKUP_LOCAL_DIR" ] ; then
  echo "BACKUP_LOCAL_DIR not set. Exiting."
  exit -1
fi

: ${MYSQL_BACKUP_FILE:='mysql_dump'}

BACKUP_PATH="$BACKUP_LOCAL_DIR$MYSQL_BACKUP_FILE"

mysqldump --defaults-extra-file="$MYSQL_EXTRA_CONF" --all-databases  | split -b 50MB - "$BACKUP_PATH"
