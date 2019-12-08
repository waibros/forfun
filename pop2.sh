#!/bin/bash

FILES=`find Public/ -type f -follow -print`
for file in $FILES;
do
    INODE=`ls -i $file | awk '{print $1}'`
    FILENAME=`ls -i $file | awk '{print $2}'`
    DATE=`debugfs -R "stat <$INODE>" /dev/sda1 | grep crtime | awk -F-- '{print $2}'`
    echo $FILENAME, $DATE >> tmp.txt
    sleep 1
done