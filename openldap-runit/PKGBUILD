# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=openldap-runit
pkgver=20180429
pkgrel=3
pkgdesc="runit service scripts for openldap"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('openldap' 'runit')
provides=('init-openldap')
conflicts=('init-openldap')
source=("slapd.run")
sha256sums=('4ebf5766b9847f3e4a83cb34f95d61a8bc5874be1ed818f4ca39ad4424d03c02')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'slapd'
}
