#!/bin/sh
#*******************************************************
# Name :    wpchgpath.sh
# Purpose : changes wordpress default admin path
# Author :  bruno@brunovalentin.com
# date :    04/05/2010
#*******************************************************

newname="mypersonaladminplace" # new admin path
wpath="/var/www/wordpress" # wordpress location

# remplace wp-admin dans les fichiers
for i in `grep -Ri --binary-files=without-match "wp-admin" $wpath \
     | cut -d":" -f 1 | sort | uniq`
do
    sed -i 's/wp-admin/'$newname'/gi' $i
done

# remplace wp-login dans les fichiers
for i in `grep -Ri --binary-files=without-match "wp-login" $wpath \
     | cut -d":" -f 1 | sort | uniq`
do
    sed -i 's/wp-login/'$newname-login'/gi' $i
done

# Renomme les fichiers contenant wp-admin
find $wpath/ -type f -iname *wp-admin* | sed -e 's/\(.*\)wp-admin\(.*\)/ mv \1wp-admin\2 \1'$newname'\2/' | sh
find $wpath/ -type d -iname *wp-admin* | sed -e 's/\(.*\)wp-admin\(.*\)/ mv \1wp-admin\2 \1'$newname'\2/' | sh
find $wpath/ -type f -iname *wp-login* | sed -e 's/\(.*\)wp-login\(.*\)/ mv \1wp-login\2 \1'$newname'-login\2/' | sh
