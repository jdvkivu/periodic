# periodic
Periodic is a debian package of scheduled configurable scripts that will perform all kinds of system health checks and aggregates script outputs in one report. These scripts are ported from FreeBSD where periodic is part of the FreeBSD system itself, see [FreeBSD periodic man pages](https://www.freebsd.org/cgi/man.cgi?query=periodic&manpath=FreeBSD+11.1-RELEASE+and+Ports).

To prepare for the packaging we need to get the freebsd sources, copy all relevant files into this project and adapt them for use on Linux systems and packagable
for Debian.
As much as possible is scripted.

1. `get-freebsd-release.sh` will checkout (or clone if not already present) the freebsd sources from a release branch specified in the script.

