# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=nftables-runit
pkgver=20200417
pkgrel=2
pkgdesc="Runit service script for nftables"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('nftables' 'runit')
groups=('runit-world')
conflicts=('init-nftables')
provides=('init-nftables')
source=("nftables.run"
        "nftables.finish")
sha256sums=('00c18977a3dfad7f59a0d419929cfa567fdf1478519197e53b7f79e9cc57cb53'
            'ab2aa5c244e957f429308e722267f95655d15c716436c216977bb12b359e3eb7')

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
    _inst_sv 'nftables'
}
