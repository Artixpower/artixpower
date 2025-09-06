# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=tlp-runit
pkgver=20180314
pkgrel=5
pkgdesc="Runit service script for tlp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('tlp' 'runit')
groups=('runit-galaxy')
conflicts=('init-tlp')
provides=('init-tlp')
source=("tlp.run"
        "tlp.finish")
sha256sums=('b0712b3c2a41d4b90da91f41c778e2647f9b8cd60078a3d0704b4a201933104f'
            '5bd5cb8b7cad74bb458f8c88c04d63dab8cd6114e543e804119643da414f27dc')

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
    _inst_sv 'tlp'
}
