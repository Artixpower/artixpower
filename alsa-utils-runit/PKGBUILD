# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=alsa-utils-runit
pkgver=20220321
pkgrel=1
pkgdesc='runit service scripts for alsa-utils'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
groups=('runit-world')
depends=('alsa-utils' 'runit')
provides=('init-alsa-utils')
conflicts=('init-alsa-utils')
install=alsa-utils-runit.install
source=('alsa.run'
        'alsa.finish')
sha256sums=('b9f19c950711c45a8205ea52ca731387038a8b957798b73025f35c0656db7474'
            '0e3bfe9340dcbbd28802d2d13eca6c09faa4d6b4ba27dc18a15453230e0bfd1e')

package() {
    cd "$srcdir"
    install -Dm755 alsa.run "$pkgdir/etc/runit/sv/alsa/run"
    install -Dm755 alsa.finish "$pkgdir/etc/runit/sv/alsa/finish"
}
