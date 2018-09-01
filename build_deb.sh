#!/bin/bash
# Remove old files
if [ -f *.deb ]; then
rm ./*.deb
fi
if [ -f *.tgz ]; then
rm ./*.tgz
fi
# Check for, and install missing dependencies
apt update
required=(checkinstall build-essential software-properties-common samba samba-common rpm curl gawk bc sysstat)
findmissing() {
        for i in "$@"; do
        checkinstalled=$(apt-cache policy "$i" | grep Installed | awk '{print $2}' | tr -d "()") > /dev/null
        if [ "${checkinstalled}" = "none" ]; then
        echo "$i " >> ./missing.deps
        fi
        done
}
getmissing() {
        missing=$(cat missing.deps)
        apt install ${missing[@]}
}
echo -e "Finding and installing missing dependencies.\n"
findmissing "${required[@]}" && getmissing
rm ./missing.deps

MAINTAINER="mauro.ribeiro@hardkernel.com"

PKGVER=$(date +%Y%m%d)
GITREV=$(git rev-parse --short HEAD)

checkinstall --pkgname="cloudshell_lcd" --pkgversion="$PKGVER" -A armhf --maintainer=\"$MAINTAINER\" --pkggroup="other" --pkglicense="GPLv2" --requires="gawk,samba,samba-common,curl,sysstat" --nodoc -y -d2 --pkgrelease="4" -D