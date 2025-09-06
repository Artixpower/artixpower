# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=seatd-runit
pkgver=20231119
pkgrel=1
pkgdesc='runit service script for seatd'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
depends=(dbus-runit seatd)
provides=(init-logind logind-runit)
conflicts=(init-logind init-elogind)
source=(seatd.run seatd.check)
sha512sums=('db41c681a387fa5f26b6f1251f7d21664fef5158aebb1152908693ecbf0a25117f22a4bd59e84f2e7e4f2bdaaa93d013d2a487ffa48d9e7e310b33ede82d0531'
            'e14e57f3c19fc191ca4484ceb0f295c4815d22bdd226d3de2d4924677d0bbcb29e6f2a8287ae6ce4cd812ef24170ccfe6d0aff7c076eee9ce3c566a13599faad')

package() {
    cd "$srcdir"
    install -Dm755 seatd.run "$pkgdir/etc/runit/sv/seatd/run"
    install -Dm755 seatd.check "$pkgdir/etc/runit/sv/seatd/check"

    install -d "${pkgdir}/etc/runit/runsvdir/default"
    ln -s seatd "${pkgdir}/etc/runit/sv/logind"
    ln -s ../../sv/logind "${pkgdir}/etc/runit/runsvdir/default/logind"
}
