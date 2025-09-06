# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=ufw-runit
pkgver=20200614
pkgrel=3
pkgdesc="Runit service script for ufw"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('ufw' 'runit')
groups=('runit-galaxy')
conflicts=('init-ufw')
provides=('init-ufw')
source=("ufw.run"
        "ufw.finish")
sha256sums=('30a427d380dde4e7d10ec6a14303b02e28af85f3817785d8a9938d96ac25e949'
            '2ab02f56ca98a14573145cf46dbb5152ed45599d1bb434d0795164b7ccf02a32')

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
    _inst_sv 'ufw'
}
