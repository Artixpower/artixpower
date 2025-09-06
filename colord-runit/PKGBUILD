# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Carlo den Otter <artist@artixlinux.org>

pkgname=colord-runit
pkgver=20220525
pkgrel=1
pkgdesc="Runit service script for colord"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('colord' 'runit')
groups=('runit-world')
conflicts=('init-colord')
provides=('init-colord')
source=("colord.run")
sha256sums=('8c650900af5ee6c7d352d0a079c9a8ccd68f107265c9911a19586acbdae77656')

package() {
    install -Dm755 colord.run "$pkgdir/etc/runit/sv/colord/run"
}
