#!/bin/bash

if [ -r securesyncvar.bash ]; then
 source securesyncvar.bash
else
 exit 1
fi

#These are being called in a different file
#SOURCE=/var/backups/*.enc#
#DEST=1234@usw-s123.rsync.net:#
#TAR=#path to directory to be backed up#
 
#Change working directory to /var/backups
cd /var/backups
 
#Create an archive of the directory to be backed up#
tar -zcvf ##.tar $TAR
 
#Encrypt the tarball#
#will be changed to symetric keyfile and then asymentric keyfile#
openssl enc -aes-256-cbc -salt -in ##.tar -out ##.enc -pass pass:##
 
#Rsync the encrypted tarball to rsync.net#
/usr/bin/rsync -av --delete $SOURCE $DEST
  
#Cleanup old archives
rm -rf *.tar *.enc


