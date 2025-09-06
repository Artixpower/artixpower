# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=postgresql-runit
pkgver=20230414
pkgrel=1
pkgdesc='Runit service scripts for postgresql'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
depends=(postgresql runit)
groups=(runit-world)
provides=(init-postgresql)
conflicts=(init-postgresql)
source=(postgresql.run
        postgresql.log.run
        postgresql.conf)
sha256sums=('4a3e5ae37b1e6b401fe2a153a99de04c67b2945e08a6734a556614c3b6e29828'
            '838bf095874e5a3d44978ef88cacb67f9894e4a7f8558ad10e9f4c617f8fb8bd'
            '62870cdb1665f8a4a614110617bc9f2a1c39ca38898bbbf80befa67c6752438e')

package() {
    cd "$srcdir"
    install -Dm755 postgresql.run "$pkgdir/etc/runit/sv/postgresql/run"
    install -Dm755 postgresql.log.run "$pkgdir/etc/runit/sv/postgresql/log/run"
    install -Dm644 postgresql.conf "$pkgdir/etc/runit/sv/postgresql/conf"
}
