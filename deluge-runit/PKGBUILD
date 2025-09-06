# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=deluge-runit
pkgver=20200711
pkgrel=3
pkgdesc="runit service scripts for deluge"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('runit' 'deluge')
provides=('init-deluge')
conflicts=('init-deluge')
source=("deluged.run"
        "deluge-web.run")
sha256sums=('b7c11c88986f76af8c9ed9b7b3b33e0a2a5f4ff25e3bcd40640308f0f94a15e4'
            'dc0bf94b885824aad2712303caecdbab59d3ec2e79bc2fba529f20b94344ae53')

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
    _inst_sv 'deluged'
    _inst_sv 'deluge-web'
}
