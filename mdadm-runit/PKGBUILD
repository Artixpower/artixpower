# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=mdadm-runit
pkgver=20180429
pkgrel=3
pkgdesc="runit service scripts for mdadm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('mdadm' 'runit')
provides=('init-mdadm')
conflicts=('init-mdadm')
source=("mdadm.run")
sha256sums=('651ab1a6b9a643bfd725c43cbac28cf0299d9b9caaf583f3c33787b48e2c86d7')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'mdadm'
}
