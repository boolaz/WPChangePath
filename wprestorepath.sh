#!/bin/sh
#*******************************************************
# Name :    wprestoregpath.sh
# Purpose : restore wordpress admin path
# Author :  bruno@brunovalentin.com
# date :    04/05/2010
#*******************************************************

newname="mypersonaladminplace"
wpath="/var/www/wordpress"

# remplace wp-login dans les fichiers
for i in `grep -Ri --binary-files=without-match "$newname-login" $wpath \
     | cut -d":" -f 1 | sort | uniq`
do
    sed -i 's/'$newname-login'/wp-login/gi' $i
done

# remplace wp-admin dans les fichiers
for i in `grep -Ri --binary-files=without-match "$newname" $wpath \
     | cut -d":" -f 1 | sort | uniq`
do
    sed -i 's/'$newname'/wp-admin/gi' $i
done


# Renomme les fichiers contenant wp-admin
find $wpath/ -type f -iname *$newname-login* | sed -e 's/\(.*\)'$newname'-login\(.*\)/ mv \1'$newname'-login\2 \1wp-login\2/' | sh
find $wpath/ -type f -iname *$newname* | sed -e 's/\(.*\)'$newname'\(.*\)/ mv \1'$newname'\2 \1wp-admin\2/' | sh
find $wpath/ -type d -iname *$newname* | sed -e 's/\(.*\)'$newname'\(.*\)/ mv \1'$newname'\2 \1wp-admin\2/' | sh
