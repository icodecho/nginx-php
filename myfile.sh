#!/bin/bash
if [ "$MY_WGET_FILE_URI" = "" ] ; then
echo "the environment[MY_WGET_FILE_URI] not set. Exiting."
exit 1
else
rm -f /var/www/*
wget -P /var/www/ http://$MY_WGET_FILE_URI/$MY_WGET_FILE_NAME
echo "========================================================================"
echo ""
echo "==the uri is '$MY_WGET_FILE_URI'=="
echo "==the file is '$MY_WGET_FILE_NAME'=="
echo ""
echo "========================================================================"
unzip /var/www/$MY_WGET_FILE_NAME -d /var/www/
rm -f /var/www/$MY_WGET_FILE_NAME
fi
