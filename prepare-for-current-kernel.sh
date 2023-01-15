#!/bin/sh
VERSION=`uname -r | grep -o '^[0-9]\+\.[0-9]\+'`

if { echo $VERSION ; echo "5.7" ; } | sort -V -c 2>/dev/null
then
  PATCHFILE="patch"
elif { echo $VERSION ; echo "5.99" ; } | sort -V -c 2>/dev/null
then
  PATCHFILE="patch5.8"
else
  PATCHFILE="patch6.0"
fi

echo "Using: $PATCHFILE"

curl "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/platform/x86/asus-wmi.c?h=linux-$VERSION.y" -o 'asus-wmi.c'
curl "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/platform/x86/asus-wmi.h?h=linux-$VERSION.y" -o 'asus-wmi.h'
curl "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/platform/x86/asus-nb-wmi.c?h=linux-$VERSION.y" -o 'asus-nb-wmi.c'
patch -p1 < $PATCHFILE
rm *.orig
