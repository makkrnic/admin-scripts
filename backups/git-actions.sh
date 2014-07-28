#!/bin/bash

pushd "$BACKUP_LOCAL_DIR"

if [ ! -d './.git' ] ; then
  echo -e "Not a git repository.\nInitializing"
  git init
fi

git add -A .
git commit -m "Backup"

popd
