#!/bin/bash
#This script collects the file paths as variables to populate the securesync.variables file for use in the main script.#

function rsync {
read -p "Enter the name of your rsync server in format 1234@usw-s123.rsync.net: The colon must be at the end!!!" DEST
}

function usbdrive {
echo you chose usbdrive
}

function local {
echo you chose local
}



OPTIONS="rsync usbdrive local"
select opt in $OPTIONS;
do
   if [ "$opt" = "rsync" ]; then
      rsync
   elif [ "$opt" = "usbdrive" ]; then
      usbdrive
   elif [ "$opt" = "local" ]; then
      local
   else
      clear
      echo invalid option
   fi
break
done
DATE=$(date | awk '{print $2, $3, $6}')
read -p "Enter the directory to be backed up in format /dir1/dir1" TAR

#This will create a new securesync.variables file
 echo "DEST = $DEST" > securesync.variables
 echo "TAR = $TAR" >> securesync.variables
 echo "DATE = $DATE" >> securesync.variables




