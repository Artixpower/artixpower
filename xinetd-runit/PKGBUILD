# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=xinetd-runit
pkgver=20210425
pkgrel=1
epoch=1
pkgdesc="runit service scripts for xinetd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('xinetd' 'runit')
provides=('init-xinetd')
conflicts=('init-xinetd')
source=("xinetd.run")
sha256sums=('abade658564cfb5f7ed9d343be80a33195df632e82577a6574b45804ab9b7b5b')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'xinetd'
}
