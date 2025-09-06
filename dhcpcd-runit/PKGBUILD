# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=dhcpcd-runit
pkgver=20200620
pkgrel=2
pkgdesc="runit service scripts for dhcpcd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('dhcpcd' 'runit')
provides=('init-dhcpcd')
conflicts=('init-dhcpcd')
source=("dhcpcd.run" "dhcpcd.conf")
sha256sums=('0638d085d6703d51a29c26ca1483a1038e108f87dd78d32d2fff95cf9fc4fe2f'
            'd75e413073215f062a56b47d4ec0366e2ae6b5d480fae21fada25d3e33269125')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
    if test -f "$srcdir/$1.conf"; then
        install -Dm644 "$srcdir/$1.conf" "$pkgdir/etc/runit/sv/$1/conf"
    fi
}

package() {
    _inst_sv 'dhcpcd'
}
