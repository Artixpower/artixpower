# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=ntp-runit
pkgver=20210301
pkgrel=3
pkgdesc="runit service scripts for ntp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('ntp' 'runit')
conflicts=('openntpd' 'init-ntp' 'init-timed')
provides=('init-ntp' 'init-timed')
source=("ntpd.run")
sha256sums=('6ee5781605810724601793dce19c9ae946a825bf5796ca757a018be9f0a0fd8b')

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
    _inst_sv 'ntpd'
}
