#!/bin/sh
RELEASE_POST=$1
POSTS_DIR=../../_posts
if [ ! -f $RELEASE_POST ]
then
 echo "Cant find $RELEASE_POST"
else
 echo "Moving $RELEASE_POST to $POSTS_DIR"
 mv $RELEASE_POST $POSTS_DIR
fi


