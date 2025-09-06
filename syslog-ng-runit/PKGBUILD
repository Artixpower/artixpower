# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=syslog-ng-runit
pkgver=20180226
pkgrel=4
pkgdesc="runit service scripts for syslog-ng"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('syslog-ng' 'runit')
conflicts=('init-syslog-ng')
provides=('init-syslog-ng')
source=("syslog-ng.run")
sha256sums=('479057f277a7f3b40f115256149a6ce34b7f57332964235a29d8df223332870a')

_inst_logsv() {
    for file in run finish check; do
        if test -f "$srcdir/log$1.$file"; then
            install -Dm755 "$srcdir/log$1.$file" "$pkgdir/etc/runit/sv/$1/log/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/log/$file"
        fi
    done
}

_inst_sv() {
    if test -f "$srcdir/$1.conf"; then
        install -Dm644 "$srcdir/$1.conf" "$pkgdir/etc/runit/sv/$1/conf"
    fi

    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'syslog-ng'
}
