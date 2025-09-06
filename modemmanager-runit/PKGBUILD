# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname=modemmanager-runit
pkgver=20221204
pkgrel=2
pkgdesc='Runit service script for modemmanager'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=(dbus-runit modemmanager runit)
groups=(runit-galaxy)
provides=(init-modemmanager)
conflicts=(init-modemmanager)
source=(modemmanager.run modemmanager.log.run)
sha256sums=('e82e583be948261f6673639bdce1a60629c21cff311ee8c1dffa211d03c47434'
            '76b48719bbf2aed0dd15f0b4a02249adcbebd03bf53cb440b7443585bc6e07a3')

package() {
    cd "$srcdir"
    install -Dm755 modemmanager.run "$pkgdir/etc/runit/sv/modemmanager/run"
    install -Dm755 modemmanager.log.run "$pkgdir/etc/runit/sv/modemmanager/log/run"
}
