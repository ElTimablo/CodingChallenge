#!/bin/bash
IPADDRESS=`ip addr | grep eth0 | awk '/inet/ {print $2;}'`
sed -i -e 's/IPADDRVAR/$IPADDRESS/g' /etc/apache2/sites-enabled/000-default.conf
apachectl -D FOREGROUND
