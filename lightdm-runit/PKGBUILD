# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=lightdm-runit
pkgver=20220815
pkgrel=1
pkgdesc='runit service scripts for lightdm'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
groups=('runit-world')
depends=('lightdm' 'init-logind')
provides=('init-lightdm' 'init-displaymanager')
conflicts=('init-lightdm' 'init-displaymanager')
install='lightdm-runit.install'
source=('lightdm.run' 'lightdm.log.run')
sha256sums=('f70aca15f941b58c33d085819052a1ba479fae34ef93a7547edc9b201bffb967'
            'e7886cd6614280f0ee7fd25c105101a21b444b8b242dfff7f3d1b8c48127d0de')

package() {
    cd "$srcdir"
    install -Dm755 lightdm.run "$pkgdir/etc/runit/sv/lightdm/run"
    install -Dm755 lightdm.log.run "$pkgdir/etc/runit/sv/lightdm/log/run"
}
