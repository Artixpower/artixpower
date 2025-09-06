# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=gpm-runit
pkgver=20180226
pkgrel=3
pkgdesc="runit service scripts for gpm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('gpm' 'runit')
conflicts=('init-gpm')
provides=('init-gpm')
source=("gpm.run")
sha256sums=('2d738d975256c17833b16946723b49ca02b1346b1e81d1fe1aee5dd864804e81')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'gpm'
}
