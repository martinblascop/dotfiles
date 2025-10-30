#!/bin/bash

REPOSITORIES_DIR=${1%/}
HOOKS_DIR="`dirname $0`/hooks"

if [ -z "$REPOSITORIES_DIR" ] ; then
  echo Missing script argument
  echo usage: $0 \$DIR
  exit 1
fi

for repository in `find $REPOSITORIES_DIR -depth -maxdepth 2 -type d -name '.git'` ; do
  cp $HOOKS_DIR/commit-msg ${repository}/hooks
done

# before run `setfattr --name user.type --value tofu $TOFU_REPOSITORY`
for tofu_repository in `getfattr --recursive --absolute-name --name "user.type" --match "tofu" $REPOSITORIES_DIR 2> /dev/null | grep file | cut -d ' ' -f3` ; do
  cp $HOOKS_DIR/pre-commit-tofu ${tofu_repository}/.git/hooks/pre-commit
done
