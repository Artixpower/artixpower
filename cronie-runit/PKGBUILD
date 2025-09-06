# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=cronie-runit
pkgver=20200613
pkgrel=3
pkgdesc="runit service scripts for cronie"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('cronie' 'runit')
provides=('init-cronie' 'init-cron')
conflicts=('fcron' 'init-cronie' 'init-cron')
source=("cronie.run")
sha256sums=('882836bff4df1d856a40c4d288d88f8e00685f0683e545bc5193bf754be0e1d6')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'cronie'
}
