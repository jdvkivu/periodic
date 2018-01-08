#!/bin/sh
#
# Fix file paths
#

# change /etc/defaults path to /etc/default
sed -i -e 's#/etc/default#/etc/default#g' $(find package/periodic-11.1 ! -path ./debian -type f)
