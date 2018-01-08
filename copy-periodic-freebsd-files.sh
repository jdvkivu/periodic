#!/bin/sh
#
# Copy periodic relevant files from FreeBSD sources into our project
#


# tools/build/mk/OptionalObsoleteFiles.inc
# usr.bin/locate/locate/locate.1
# usr.bin/locate/locate/locate.updatedb.8
# usr.bin/msgs/msgs.1
# targets/pseudo/userland/Makefile.depend
# etc/Makefile
# etc/crontab
# etc/mtree/BSD.root.dist   ??? =>  to create folder structures including /etc/periodic/daily|weekly|...
# etc/defaults/Makefile
# etc/defaults/periodic.conf
# usr.sbin/periodic/Makefile
# usr.sbin/periodic/periodic.sh
# usr.sbin/periodic/periodic.8
# usr.sbin/Makefile        ???? => make usr/sbin/periodic
# usr.sbin/mailwrapper/mailwrapper.8   => dependency on periodic.conf
# contrib/tcsh/tcsh.man    ????  => man page explaining something about special alias to schedule something with periodic
# contrib/sendmail/FREEBSD-upgrade
# share/man/man5/Makefile
# share/man/man5/periodic.conf.5
# ObsoleteFiles.inc


FREEBSD_SOURCE=../freebsd
DEST=package/periodic-11.1

ensure_dir_present() {
	if [ ! -d $1 ]; then
		echo "create $ directory"
		mkdir $1
	fi
}


# conf file
#
echo "copy etc/defaults/periodic.conf"
cp $FREEBSD_SOURCE/etc/defaults/periodic.conf $DEST/

# main script
#
echo "copy usr.sbin/periodic/periodic.sh"
cp $FREEBSD_SOURCE/usr.sbin/periodic/periodic.sh $DEST/periodic

# all check scripts
#
echo "copy etc/periodic/ $DEST/scripts"
ensure_dir_present $DEST/scripts
cp -r $FREEBSD_SOURCE/etc/periodic/ $DEST/scripts/

echo "remove Makefile stuff"
find $DEST -name "Makefile*" -delete -print

# man pages
#
echo "copy usr.sbin/periodic/periodic.8"
ensure_dir_present $DEST/man
cp $FREEBSD_SOURCE/usr.sbin/periodic/periodic.8 $DEST/man/

echo "copy share/man/man5/periodic.conf.5"
cp $FREEBSD_SOURCE/share/man/man5/periodic.conf.5 $DEST/man/
