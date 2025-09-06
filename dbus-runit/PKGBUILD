# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dbus-runit
pkgver=20220314
pkgrel=1
pkgdesc='runit service scripts for dbus'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
depends=('dbus' 'runit')
provides=('dbus-runscripts' 'init-dbus')
conflicts=('init-dbus')
replaces=('dbus-runscripts')
install='dbus-runit.install'
source=('dbus.run'
        'dbus.check'
        'dbus.log.run'
        '80-dbus.sh')
b2sums=('ba3c92be8e5472a2098a96e8b2a483161e0750de31fb6c28880cf8c66b189d68006f62dc0e61ea643342b6484b65f0dc6eed46b58b681c27f7059b78817fb89a'
        '0e84aebbd8d84213d7eea5828ea94a69a2c185fbbb684b9856735041921cac7299057a55902f44ce4084217fe869d58ee7054efc7d2b29876755bfabc2ae9722'
        'c1a8f17b67358709895f6db580316649e2815a9be895417ac5c4ed916b4df8230ddd8a72ac6c899185ada9c30567ee9f41815b99fc064c556350370b2d82569f'
        '2221be465e81d2b71c26785116b456c74942a8db48b1216deff7cde3b64e03cd77ecabdce55bd3c396a7ab9a1e5d2e2f86624c240ca5fa65c680918fbe3533e1')

package() {
    cd "$srcdir"

    install -Dm755 dbus.run "$pkgdir/etc/runit/sv/dbus/run"
    install -Dm755 dbus.check "$pkgdir/etc/runit/sv/dbus/check"
    install -Dm755 dbus.log.run "$pkgdir/etc/runit/sv/dbus/log/run"

    install -d "${pkgdir}/etc/runit/runsvdir/default"
    ln -s "../../sv/dbus" "${pkgdir}/etc/runit/runsvdir/default/dbus"

    install -Dm755 80-dbus.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/80-dbus.sh"
}
