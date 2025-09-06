# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=rpcbind-runit
pkgver=20180429
pkgrel=4
pkgdesc="runit service scripts for rpcbind"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('rpcbind' 'runit')
provides=('init-rpcbind')
conflicts=('init-rpcbind')
source=("rpcbind.run")
sha256sums=('1f3005344868b25a791bb470ba68e03e008f4755f2e0d59a5e3e8728a63b8a05')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'rpcbind'
}
