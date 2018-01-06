
#!/bin/bash
#
# Get FreeBSD release sources
#

BRANCH="release/11.1.0"

PERIODIC_DIR="$(dirname $(realpath $0))"

# move one folder up to checkout freebsd sources next to this repository
cd ..
# Only clone if freebsd is not yet checked out, the repo is over 1GB.
#
if [ ! -d freebsd ]; then
	# freebsd is not here, lets check it out
	echo "cloning freebsd $BRANCH"
	git clone -b $BRANCH git@github.com:freebsd/freebsd.git
else
	# freebsd sources already checked out, make sure we have the correct release
	echo "checkout freebsd $BRANCH"
	cd freebsd
	git checkout -B $BRANCH && git pull
	cd ..
fi


# move back into periodic folder
cd $PERIODIC_DIR
