#!/bin/bash

FILE_PATH='/root/password_reset_script_ran.txt'

if [ -f "$FILE_PATH" ] ; then
  exit 0
fi

#Force password changes for root and vagrant users
chage -d 0 vagrant
chage -d 0 root

touch $FILE_PATH
