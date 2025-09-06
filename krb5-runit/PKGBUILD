# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=krb5-runit
pkgver=20180605
pkgrel=5
pkgdesc="runit service scripts for krb5"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('krb5' 'runit')
provides=('init-krb5')
conflicts=('init-krb5')
source=("kadmind.run"
        "krb5kdc.run")
sha256sums=('aa0879a6193df0f52b0eff10bb00733c5c2fe31a4374894672e864b32fb3d59e'
            '73613cbd4549721483463f5ae6ef6041c02c8c92c742014ca912451f4a25d01e')

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
    _inst_sv 'kadmind'
    _inst_sv 'krb5kdc'
}
