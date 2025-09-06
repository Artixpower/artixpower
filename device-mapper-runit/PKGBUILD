# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=device-mapper-runit
pkgver=20180429
pkgrel=3
pkgdesc="runit service scripts for device-mapper"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('device-mapper' 'runit')
provides=('init-device-mapper')
conflicts=('init-device-mapper')
source=("dmeventd.run")
sha256sums=('3c52d251f78e21a3013a856d2b3beda880ff3c7676a2149768a45d421057bbe8')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'dmeventd'
}
