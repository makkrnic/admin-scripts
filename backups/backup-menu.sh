#!/bin/sh


source './config'

: ${BACKUP_LOCAL_DIR:='/var/sysadminscripts-backups/'}

mkdir -p "$BACKUP_LOCAL_DIR"

echo "Backing up postgres databases..."
source ./backup-postgres.sh
echo "done."

echo "Backing up mysql databases..."
source ./backup-mysql.sh
echo "done."

