# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=iwd-runit
pkgver=20220305
pkgrel=2
pkgdesc='Runit service script for iwd'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=(dbus-runit iwd runit)
groups=(runit-galaxy)
provides=(init-iwd)
conflicts=(init-iwd)
install=iwd-runit.install
source=(iwd.run iwd.log.run)
sha256sums=('89b7e599aae113271d0610814cbf960700605e73edf6581d376058a5b6b26811'
            'e143cda9e80ee371fa16339f8a167163f1d49f02467976b496989f2de85cf3f7')

package() {
    cd "$srcdir"
    install -Dm755 iwd.run "$pkgdir/etc/runit/sv/iwd/run"
    install -Dm755 iwd.log.run "$pkgdir/etc/runit/sv/iwd/log/run"
}
