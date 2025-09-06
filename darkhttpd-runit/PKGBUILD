# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=darkhttpd-runit
pkgver=20200711
pkgrel=2
pkgdesc="runit service scripts for darkhttpd"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-galaxy')
depends=('darkhttpd' 'runit')
conflicts=('init-darkhttpd')
provides=('init-darkhttpd')
source=("darkhttpd.run"
        "darkhttpd.conf"
        "logdarkhttpd.run")
sha256sums=('228239240e431d88f1c39fb3ed51212c0e2f9f55287cd6fabf5c0ba88dd2f5c0'
            '4c29bb0731bf8d406256141db840c5872f7dba1ff105f3489d35a391e2d9becb'
            'b8aede4e77f7c6e8899c42c1c8fd10fa500225644c86513d5efa8bc80010da04')

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
    _inst_sv 'darkhttpd'
    _inst_logsv 'darkhttpd'
}
