# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=lvm2-runit
pkgver=20210205
pkgrel=3
pkgdesc="runit stage1 scripts for lvm2"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('lvm2' 'runit-rc')
provides=('init-lvm2')
conflicts=('init-lvm2')
source=("lvm2-monitoring"
        "lvm2")
sha256sums=('7a1cdb90aa145a2904bac250d9069a3b7a94330f65d06141c1f89a613c0a8dad'
            '200edb4bed3a9335040432a56c7e54ee5a569476cec155640f915664b3466c34')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    install -Dm755 "${srcdir}/lvm2" "${pkgdir}/usr/lib/rc/sv.d/lvm2"
    install -Dm755 "${srcdir}/lvm2-monitoring" "${pkgdir}/usr/lib/rc/sv.d/lvm2-monitoring"

    # create default symlinks?
    install -d ${pkgdir}/etc/rc/{sysinit,shutdown}
    ln -sf /usr/lib/rc/sv.d/lvm2 ${pkgdir}/etc/rc/sysinit/34-lvm2
    ln -sf /usr/lib/rc/sv.d/lvm2 ${pkgdir}/etc/rc/shutdown/64-lvm2
}
