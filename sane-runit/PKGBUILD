# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=sane-runit
pkgver=20240619
pkgrel=1
pkgdesc="runit service scripts for sane"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('sane' 'runit')
conflicts=('init-sane')
provides=('init-sane')
source=("saned.run")
sha512sums=('29668ffade166e3acd9cccbdfcf163f04cacdbd24101448dd44a8fe49073f9e0c660ee54a5fb90863bb78ee6d20316da39caf0caa7c3216ff069e5fb2a1f7d52')

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
    _inst_sv 'saned'
}
