#!/bin/bash

if [ -r securesync.variables ]; then
 source securesync.variables
else
 exit 1
fi

#if []; then 
#else 
#  exit 1
#fi

#This script will need to be run as sudo or root to use the /var/backups system directory. 
 
#Change working directory to /var/backups
cd /var/backups
 
#Create an archive of the directory to be backed up#
tar -zcvf ##.tar $TAR
 
#Encrypt the tarball#

#will be changed to symetric keyfile and then asymentric keyfile#
openssl enc -aes-256-cbc -salt -in ##.tar -out ##.enc -pass pass:##
 
#Rsync the encrypted tarball to rsync.net#
/usr/bin/rsync -av $SOURCE $DEST
  
#Cleanup old archives
rm -rf *.tar *.enc


