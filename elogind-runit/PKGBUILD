# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=elogind-runit
pkgver=20231119
pkgrel=1
pkgdesc='runit service scripts for elogind'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
depends=(dbus-runit elogind)
provides=(init-elogind init-logind logind-runit)
conflicts=(init-elogind init-logind)
source=(elogind.run elogind.check)
sha512sums=('7958b83f642a113e440162048b43ba961f69d6b3e6af86453bd5e90b6642f3fc7fd4990865d36425cc23aae58f7cbcebec1c58009a7f2f7d8254cc880058e125'
            '229aacbed1ee55e49f7c26adccf521e8966527cb7bd9cb71af6ac47611e424579e77c3c289e105244bfb0647d9a19819fae085c1c72d2386e4ca4bca9f9f36a6')

package() {
    install -Dm755 "$srcdir/elogind.run" "$pkgdir/etc/runit/sv/elogind/run"
    install -Dm755 "$srcdir/elogind.check" "$pkgdir/etc/runit/sv/elogind/check"

    install -d "${pkgdir}/etc/runit/runsvdir/default"
    ln -s elogind "${pkgdir}/etc/runit/sv/logind"
    ln -s ../../sv/logind "${pkgdir}/etc/runit/runsvdir/default/logind"
}
