# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=samba-runit
pkgver=20211002
pkgrel=1
pkgdesc="runit service scripts for samba"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('samba' 'runit')
conflicts=('init-samba')
provides=('init-samba')
source=("smbd.run"
        "logsmbd.run"
        "nmbd.run"
        "lognmbd.run")
sha256sums=('6d26db6a16251f940b72efc5b004ebd06f1a9af7b90e780e91e1b0b26d7f0d56'
            'dbc8da9e934f3ec99020b10958e2de2cda7174385547b71f51e6d1af05268d02'
            'b27430058a4cfe2473f18f03128e6162d36af42ec44eb973420cbf17511dee92'
            '3e87cec9a2d9d88982b55cd38e26c09c44e2fd545a2918cba71c7317ef095af4')

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
    _inst_sv 'smbd'
    _inst_logsv 'smbd'
    _inst_sv 'nmbd'
    _inst_logsv 'nmbd'
}
