#!/bin/bash

REPOSITORIES_DIR=$1
HOOKS_DIR="`dirname $0`/hooks"

if [ -z "$REPOSITORIES_DIR" ] ; then
  echo Missing script argument
  echo usage: $0 \$DIR
  exit 1
fi

for repository in `find $REPOSITORIES_DIR -depth -maxdepth 2 -type d -name '.git'` ; do
  cp $HOOKS_DIR/* ${repository}/hooks
done
