# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=vsftpd-runit
pkgver=20200614
pkgrel=3
pkgdesc="Runit service script for vsftpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('vsftpd' 'runit')
groups=('runit-galaxy')
conflicts=('init-vsftpd')
provides=('init-vsftpd')
source=("vsftpd.run"
        "vsftpd-ipv6.run")
sha256sums=('e9f6754d2717946b5a0072fa4469684c3091161ccc70403e1ef240c98f5c38d2'
            'e2804bc64dd4bbf7fda2203f57196dbd9d3cae721506eb59c3e59f9175625ff9')

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
    _inst_sv 'vsftpd'
    _inst_sv 'vsftpd-ipv6'
}
