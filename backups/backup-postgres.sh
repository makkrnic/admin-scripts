#!/bin/sh

if [ -z "$BACKUP_LOCAL_DIR" ] ; then
  echo "BACKUP_LOCAL_DIR not set. Exiting."
  exit -1
fi

: ${POSTGRES_BACKUP_FILE:='postgres_dump'}

BACKUP_PATH="$BACKUP_LOCAL_DIR$POSTGRES_BACKUP_FILE"

sudo -u "$POSTGRES_USER" pg_dumpall | split -b 50MB - "$BACKUP_PATH"
