# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=sndio-runit
pkgver=20200417
pkgrel=3
pkgdesc="runit service scripts for sndio"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-galaxy')
depends=('sndio' 'runit')
conflicts=('init-sndio')
provides=('init-sndio')
source=("sndio.run"
        "logsndio.run")
sha256sums=('e0581321580c957e2ca1341a3bdc9231fb8f53d1abfb18f66c574d7d8d54808a'
            'f3b655e50a6e1b2ffb71d98db3474ee5fc9cf756f640300075f43bcab04f7574')

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
    _inst_sv 'sndio'
    _inst_logsv 'sndio'
}
