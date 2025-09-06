# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=apache-runit
pkgver=20220314
pkgrel=1
pkgdesc='runit service scripts for apache'
arch=('any')
url='https://artixlinux.org'
license=('BSD')
groups=('runit-world')
depends=('apache' 'runit')
conflicts=('init-apache')
provides=('init-apache')
install='apache-runit.install'
source=("apache.run"
        "apache.log.run")
b2sums=('a4c806107475204a606489d173dcbfc883a2144e2105807ae4ae709f8dfe474eeddf4c7bd5ad8b925ffff194d2a4b8b0696f186f5acd3b4e517e0ff3564cd5d3'
        '10c6961546c622b7e3ef82e7b24d8e67c43cd966832f3125f425a4a3fbb12dfd4e399f3f3a82fd7523714b4b93b5b71f0f067a954a5ed26c8c2737b070438c31')

package() {
    cd "$srcdir"

    install -Dm755 apache.run "$pkgdir/etc/runit/sv/apache/run"
    install -Dm755 apache.log.run "$pkgdir/etc/runit/sv/apache/log/run"
}
