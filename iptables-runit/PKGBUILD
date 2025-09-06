# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=iptables-runit
pkgver=20200613
pkgrel=3
pkgdesc="runit service scripts for iptables"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('iptables' 'runit')
provides=('init-iptables')
conflicts=('init-iptables')
source=("iptables.run"
        "ip6tables.run")
sha256sums=('8a69f5d365de713d7bfce3a9bf203c44125e3d21ba38243d4aff0a8694b21afd'
            'ec579babdb3d5baf7f533a4f9c4573ef312fc7c45a02374868350dd291967b42')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'iptables'
    _inst_sv 'ip6tables'
}
