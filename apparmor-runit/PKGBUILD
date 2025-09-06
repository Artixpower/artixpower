# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apparmor-runit
pkgver=20220321
pkgrel=2
pkgdesc="runit stage1 script for AppArmor"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-world')
provides=('init-apparmor')
depends=('apparmor' 'runit')
conflicts=('init-apparmor')
backup=('etc/rc/apparmor.conf')
install=apparmor-runit.install
source=('apparmor' 'apparmor.conf')
sha256sums=('72d34e3b73310db995ddf1b3ff28f5e553c9079f61885efb120592594c544a1e'
            '2d706f8c6b5bbb35087890f6ce3f4cdb94854b893050eb215274293f094b682a')

package() {
    install -Dm755 "${srcdir}/apparmor" "${pkgdir}/usr/lib/rc/sv.d/apparmor"
    install -Dm644 "${srcdir}/apparmor.conf" "${pkgdir}/etc/rc/apparmor.conf"

    install -d ${pkgdir}/etc/rc/sysinit
    ln -s ../../../usr/lib/rc/sv.d/apparmor ${pkgdir}/etc/rc/sysinit/96-apparmor
}
