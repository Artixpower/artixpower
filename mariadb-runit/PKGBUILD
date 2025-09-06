# Maintainer: artist <artist@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=mariadb-runit
pkgver=20200823
pkgrel=3
pkgdesc="Runit service script for mariadb"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('mariadb' 'runit')
groups=('runit-world')
conflicts=('init-mariadb' 'init-mysql')
provides=('init-mariadb')
source=("mariadb.run")
sha256sums=('46dd414421ef287522fc7b585ad21d440ad4c9454033a76e9a104dc1f8ab0528')

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
    _inst_sv 'mariadb'
}
