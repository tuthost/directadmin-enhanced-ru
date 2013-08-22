#!/bin/sh

download=`which wget`
pathskin=/usr/local/directadmin/data/skins
pathtpl=/usr/local/directadmin/data/templates

mkdir /tmp/enhanced
$download --no-check-certificate https://github.com/tuthost/directadmin-enhanced-ru/tarball/master -O /tmp/enhanced.tar.gz
tar -xzf /tmp/enhanced.tar.gz -C /tmp/enhanced

#####################################################
# COPY SKIN ENHANCED
#####################################################

cd /tmp/enhanced/`ls /tmp/enhanced`/skins/enhanced
cp -fR * $pathskin/enhanced
chown -R diradmin:diradmin $pathskin/enhanced

#####################################################
# COPY CUSTOM TPL
#####################################################

cd /tmp/enhanced/`ls /tmp/enhanced`/templates/custom
cp -fR * $pathtpl/custom
chown -R diradmin:diradmin $pathtpl/custom

#####################################################

rm -R /tmp/enhanced
rm -f /tmp/enhanced.tar.gz

exit 0;
