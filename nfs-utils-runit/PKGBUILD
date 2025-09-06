# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=nfs-utils-runit
pkgver=20200613
pkgrel=2
pkgdesc="runit service scripts for nfs-utils"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('nfs-utils' 'rpcbind-runit' 'device-mapper-runit')
provides=('init-nfs-utils')
conflicts=('init-nfs-utils')
source=("nfs-server.run"
        "nfs-server.finish"
        "rpcblkmapd.run"
        "rpcgssd.run"
        "rpcidmapd.run"
        "rpcsvcgssd.run"
        "statd.run")
sha256sums=('2776a577b4efdcc61a57ac500f8a6ff599583cd3dbd07633d9c085f636b90435'
            'fc10c7ef7d24c20cb6749b484483ed5f7b87d10b93d377414191403dc148546f'
            '089bc7b4e31484923326850cbf2b208137e58d65dc8e20a52c81fa7e9fb586a6'
            '143bd4c0f34853ac1825e184104ca1ef4dc80c023f14aeac70a95372faa48d0b'
            'e8b9ff8a7e5736f14957298c0301442abf003a3fe0696ba0e73f21b576e820ae'
            '28876681b7610ecfb827e02d753661527c525aa54d851e799b62f09f6528be2a'
            'ef4c2d721209549e52b6de2ca53a79e8cf48be7922709c4e6c0f2edcfc605ba4')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'nfs-server'
    _inst_sv 'statd'
}
