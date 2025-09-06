# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=openvpn-runit
pkgver=20231208
pkgrel=1
pkgdesc='runit service scripts for openvpn'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
depends=('openvpn')
backup=('etc/runit/sv/openvpn/conf')
install=openvpn-runit.install
source=('openvpn.run'
	'openvpn.log.run'
        'openvpn.conf')
sha256sums=('c1b7690a4da393c056b9b3de0a96553ca0b4895ef03924ab71245af49c3082b8'
            '57758b8866e1ff856d4eed7319724eb3358d895bbda0f01622f89622052ea9c6'
            '6a91fe2d1895f92f0402b64c2ec0322b9591ffca21132b7f27bae7664c260f32')

package() {
    cd "$srcdir"
    install -Dm755 openvpn.run "$pkgdir/etc/runit/sv/openvpn/run"
    install -Dm755 openvpn.log.run "$pkgdir/etc/runit/sv/openvpn/log/run"
    install -Dm644 openvpn.conf "$pkgdir/etc/runit/sv/openvpn/conf"
}
