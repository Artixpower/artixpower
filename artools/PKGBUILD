# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=artools
pkgname=('artools-base' 'artools-pkg' 'artools-iso')
pkgver=0.37.4
pkgrel=1
pkgdesc='Development tools for Artix'
arch=('any')
url='https://gitea.artixlinux.org/artix/artools'
license=(
    'GPL-1.0-or-later'
)
makedepends=(
    'git'
)
groups=(
    'artix-tools'
    'artools'
)
# checkdepends=('shellcheck')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('2b08c97efb42326aabc5f5c171d28ea7966e603802177ed304f6467a5adfd208')

_patches=(
)

prepare() {
    cd "${pkgbase}"
    local _p
    for _p in "${_patches[@]}"; do
        git log --oneline -1 "${_p}"
        git cherry-pick -n "${_p}"
    done
}

build() {
    make -C "${pkgbase}" PREFIX=/usr BUILDTOOLVER="${pkgver}-${pkgrel}-${arch}"
}

# check() {
#     make -C "${pkgbase}" check || true
# }

package_artools-base() {
    pkgdesc='Development tools for Artix (base tools)'
    depends=(
        'awk'
        'bash'
        'coreutils'
        'grep'
        'pacman'
        'sed'
        'util-linux'
    )
    optdepends=(
        'artools-pkg: Artix package tools'
        'artools-iso: Artix iso tools'
    )

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_base
}

package_artools-pkg() {
    pkgdesc='Development tools for Artix (packaging tools)'
    depends=(
        'artools-base'
        'awk'
        'bash'
        'binutils'
        'bzr'
        'diffutils'
        'findutils'
        'git'
        'go-yq'
        'grep'
        'mercurial'
        'openssh'
        'parallel'
        'rsync'
        'sed'
        'subversion'
        'util-linux'
    )
    optdepends=(
        'pacman-contrib: pacman contrib tools support'
        'artix-rebuild-order: artix rebuild order support'
        'artix-checkupdates: updates checking'
        'graphviz: mkdepgraph graphviz support'
    )
    backup=(
        'etc/artools/artools-pkg.conf'
    )

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_pkg
}

package_artools-iso() {
    pkgdesc='Development tools for Artix (ISO tools)'
    depends=(
        'artools-base'
        'bash'
        'dosfstools'
        'e2fsprogs'
        'go-yq'
        'grep'
        'grub'
        'iso-profiles'
        'libarchive'
        'libisoburn'
        'mtools'
        'sed'
        'squashfs-tools'
    )
    backup=(
        'etc/artools/artools-iso.conf'
    )

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_iso
}
