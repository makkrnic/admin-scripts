#!/bin/sh

if [ -z "$BACKUP_LOCAL_DIR" ] ; then
  echo "BACKUP_LOCAL_DIR not set. Exiting."
  exit -1
fi

: ${SUDO_USER:='postgres'}
: ${POSTGRES_BACKUP_FILE:='postgres_dump'}

mkdir -p "$BACKUP_LOCAL_DIR"

BACKUP_PATH="$BACKUP_LOCAL_DIR$POSTGRES_BACKUP_FILE"

sudo -u "$SUDO_USER" pg_dumpall | split -b 100MB - "$BACKUP_PATH"
