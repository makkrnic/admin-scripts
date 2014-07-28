#!/bin/sh

: ${SUDO_USER:='postgres'}
: ${BACKUP_LOCAL_DIR:='/var/sysadminscripts-backups/'}
: ${POSTGRES_BACKUP_FILE:='postgres_dump'}

mkdir -p "$BACKUP_LOCAL_DIR"

BACKUP_PATH="$BACKUP_LOCAL_DIR$POSTGRES_BACKUP_FILE"

sudo -u "$SUDO_USER" pg_dumpall | split -b 100MB - "$BACKUP_PATH"
