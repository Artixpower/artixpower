# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=dhcp-runit
pkgver=20180226
pkgrel=4
pkgdesc="runit service scripts for dhcp"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('runit' 'dhcp')
provides=('init-dhcp')
conflicts=('init-dhcp')
source=("dhclient.run"
        "dhcpd4.run"
        "dhcpd6.run")
sha256sums=('0e98166a9c6f84505221283c3864c7f1a6df5ee124c476ffaf2627e7372cbce3'
            '9a24e07ca54dfe4dfe773892fbba9d5ef8b2b0aa57ea9b9889a6df151ca443f1'
            '7c2efadc0e842146d8bad9bb384d9274a90d6f2c08200a902eeaac68c1ad7535')

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
    _inst_sv 'dhclient'
    _inst_sv 'dhcpd4'
    _inst_sv 'dhcpd6'
}
