# Maintainer: artoo <artoo@artixlinux.org>

pkgname=networkmanager-openrc
pkgver=20210505
pkgrel=6
pkgdesc="OpenRC networkmanager init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-world')
provides=('init-networkmanager')
depends=('openrc' 'networkmanager')
conflicts=('init-networkmanager')
backup=('etc/conf.d/NetworkManager')
source=("NetworkManager".{initd,confd}
        '10-openrc-status')
sha256sums=('eaf7d210540ed9f4c6b4ba81ddbb30a2aa5ce8b528057f7d64ce3478981f88e4'
            '4594573f01fe5e04b6dde4525796acf909158591bdcefd662ec23fe0d1c3e1bd'
            'd32a21c0683cf7a09370b35b7e3d3b3f28f5d4d242ecde2c866cfb400b94bcbe')

package() {
    install -Dm755 "${srcdir}"/NetworkManager.initd "${pkgdir}"/etc/init.d/NetworkManager
    install -Dm644 "${srcdir}"/NetworkManager.confd "${pkgdir}"/etc/conf.d/NetworkManager

    install -Dm755 "${srcdir}"/10-openrc-status "${pkgdir}"/etc/NetworkManager/dispatcher.d/10-openrc-status
}
