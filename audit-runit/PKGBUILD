# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=audit-runit
pkgver=20181212
pkgrel=4
pkgdesc="Runit service script for audit"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('audit' 'runit')
groups=('runit-system')
conflicts=('init-audit')
provides=('init-audit')
backup=('etc/runit/sv/auditctl/conf')
source=("auditd.run"
        "auditctl.run"
        "auditctl.finish"
        "auditctl.conf")
sha256sums=('c5ba6ef008fc13274e9089dc7c5481861d3fc2b7567ebc34d7aad9c643c5f91e'
            '39033c68e2be4bb91d5401f428b213dd332f0ec9ad1f285656df61cf7d33c555'
            'ff1eaf5ca3a54bcdc368b232e0dcd4e69523a47ddc847619a8f1f61cb3cb3f95'
            '67adef67c32704dcaf62d8ab827467647253de7b38e0254ec5120b8b87357015')

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
    _inst_sv 'auditd'
    _inst_sv 'auditctl'
}
