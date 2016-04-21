#!/bin/sh

download=`which wget`

pathskin=/usr/local/directadmin/data/skins/enhanced
pathtpl=/usr/local/directadmin/data/templates/custom
pathplg=/usr/local/directadmin/plugins

mkdir /tmp/enhanced
$download --no-check-certificate https://github.com/tuthost/directadmin-enhanced-ru/tarball/master -O /tmp/enhanced/enhanced.tar.gz
tar -xzf /tmp/enhanced/enhanced.tar.gz -C /tmp/enhanced

githubkey=`ls /tmp/enhanced | grep directadmin-enhanced | awk -F- '{print $5}'`
pathenh=/tmp/enhanced/tuthost-directadmin-enhanced-ru-$githubkey

chown -R diradmin:diradmin $pathenh

#####################################################
# COPY SKIN ENHANCED
#####################################################

cp -fR $pathenh/skins/enhanced/* $pathskin

#####################################################
# COPY CUSTOM TPL
#####################################################

cp -fR $pathenh/templates/custom/* $pathtpl

#####################################################
# COPY PLUGIN LANG
#####################################################

cp -fR $pathenh/plugins/* $pathplg

#####################################################

rm -R /tmp/enhanced

exit 0;
