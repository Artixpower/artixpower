# Maintainer: artoo <artoo@artixlinux.org>

pkgname=artix-cgroups
pkgver=0.7.2
pkgrel=1
arch=('any')
pkgdesc='The Artix generic cgroups2'
license=('BSD-2-Clause')
url='https://gitea.artixlinux.org/artix/artix-cgroups'
depends=('sh')
makedepends=('git')
provides=('cg-controller')
backup=(
    'etc/artix/cgroups.conf'
)
source=("git+$url.git#tag=${pkgver}")
sha256sums=('eafc1005b73805199fbde1a70e1a420aa9eec8d282263a978407971395df1f68')

prepare() {
    cd "${pkgname}"
    # patches here
}

build() {
    make -C "${pkgname}" PREFIX=/usr CGROUP="artix"
}

package() {
    make -C "${pkgname}" PREFIX=/usr DESTDIR="${pkgdir}" install

    # license
    install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
