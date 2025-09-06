# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=cryptsetup-runit
pkgver=20220813
pkgrel=1
pkgdesc="runit stage1 script for cryptsetup"
arch=('any')
url="https://artixlinux.org"
license=('MIT')
groups=('runit-system')
provides=('init-cryptsetup')
depends=('cryptsetup' 'runit-rc')
conflicts=('init-cryptsetup')
source=('cryptsetup')
optdepends=('lvm2-runit: LVM support for encrypted filesystems')
sha256sums=('95f874b96bbc439300d646bfeb3fbad4c61b4a85b820c263256a0c01e273bb5e')

package() {
    install -Dm755 "${srcdir}/cryptsetup" "${pkgdir}/usr/lib/rc/sv.d/cryptsetup"

     install -d ${pkgdir}/etc/rc/{sysinit,shutdown}
     ln -sf /usr/lib/rc/sv.d/cryptsetup ${pkgdir}/etc/rc/sysinit/35-cryptsetup
     ln -sf /usr/lib/rc/sv.d/cryptsetup ${pkgdir}/etc/rc/shutdown/65-cryptsetup
}
