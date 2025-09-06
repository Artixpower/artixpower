# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=lxdm-runit
pkgver=20180314
pkgrel=6
pkgdesc="Runit service script for lxdm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('lxdm-gtk3' 'runit')
provides=('init-lxdm' 'init-displaymanager')
groups=('runit-galaxy')
conflicts=('init-lxdm' 'init-displaymanager')
source=("lxdm.run")
sha256sums=('ad7755e96418dd5a89999083d34458b4e82a4e71cf520adcdcf7ae22b33941f3')

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
    _inst_sv 'lxdm'
}
