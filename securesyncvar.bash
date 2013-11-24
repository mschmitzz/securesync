#!/bin/bash
#This script collects the file paths as variables to populate the securesync.variables file for use in the main script.#


read -p "Enter the name of your rsync server in format 1234@usw-s123.rsync.net: The colon must be at the end!!!" DEST
read -p "Enter the directory to be backed up in format /dir1/dir1" TAR

DATE=date | awk '{print $2, $3, $6}'
#This will create a new securesync.variables file

 echo "DEST = $DEST" > securesync.variables
 echo "TAR = $TAR" >> securesync.variables
 echo "DATE = $DATE" >> securesync.variables




