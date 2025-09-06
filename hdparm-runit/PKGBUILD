# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=hdparm-runit
pkgver=20210407
pkgrel=2
pkgdesc="runit stage1 script for hdparm"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
provides=('init-hdparm')
depends=('hdparm' 'runit-rc')
conflicts=('init-hdparm')
backup=('etc/rc/hdparm.conf')
source=('hdparm' 'hdparm.conf')
sha256sums=('d070f0a4cf2117810f9b51621dc832701c16fcf8b29fb0efc9242b11c8468b0e'
            '995bd9e410a98cd5e71696dd1141ba360e85968ce4d34d687365bd97783ee1de')

package() {
    install -Dm755 "${srcdir}/hdparm" "${pkgdir}/usr/lib/rc/sv.d/hdparm"

    install -d ${pkgdir}/etc/rc/{sysinit,shutdown}
    install -Dm644 hdparm.conf "${pkgdir}/etc/rc/"
    ln -sf /usr/lib/rc/sv.d/hdparm ${pkgdir}/etc/rc/sysinit/04-hdparm
}
