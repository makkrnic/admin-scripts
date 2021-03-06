#!/bin/sh


source './config-default'

: ${BACKUP_LOCAL_DIR:='/var/sysadminscripts-backups/'}

mkdir -p "$BACKUP_LOCAL_DIR"

if [ ! -d "$BACKUP_LOCAL_DIR" ] ; then
  echo "$BACKUP_LOCAL_DIR is not a directory or does not exist. Giving up."
  exit -1
fi

echo "Backing up postgres databases..."
source ./backup-postgres.sh
echo "done."

echo "Backing up mysql databases..."
source ./backup-mysql.sh
echo "done."

echo 'Commiting to git repository'
source ./git-actions.sh
echo 'done'
