#!/bin/bash

POSTS_DRAFT_DIR=$HOME/github/yanivpaz.github.io/addons/_posts_draft
POSTS_DATE=`date +%Y-%d-%m`
echo "Please type post name"
read postName
POST_FILE=${POSTS_DRAFT_DIR}/${POSTS_DATE}-${postName}.md
vi $POST_FILE
echo "$POST_FILE created. dont forget to commit"


