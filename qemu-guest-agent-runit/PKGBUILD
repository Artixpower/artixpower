# Maintainer: Carlo den Otter <artist@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=qemu-guest-agent-runit
pkgver=20201020
pkgrel=3
pkgdesc="Runit service script for qemu-guest-agent"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('qemu-guest-agent' 'runit')
groups=('runit-world')
conflicts=('init-qemu-guest-agent')
provides=('init-qemu-guest-agent')
source=("qemu-guest-agent.run")
sha256sums=('fbf90b928b717d2f2b23134f9759af8f58a9762216f75d2eb6e26adaffda2d20')

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
    _inst_sv 'qemu-guest-agent'
}
