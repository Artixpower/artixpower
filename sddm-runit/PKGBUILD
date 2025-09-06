# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/service|/run/runit/service|g' -e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=sddm-runit
pkgver=20211029
pkgrel=1
pkgdesc="runit service scripts for sddm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
depends=('sddm' 'dbus-runit')
provides=('init-sddm' 'init-displaymanager')
conflicts=('init-sddm' 'init-displaymanager')
source=("sddm.run::${_url}/sddm/files/sddm/run")
sha256sums=('c5cb84feb19db0bff175c0c070829f76b89f7213e6d0d48c11dd9458738ece36')

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
    _inst_sv 'sddm'
}
