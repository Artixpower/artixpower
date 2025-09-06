# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=openssh-runit
pkgver=20180429
pkgrel=4
pkgdesc="runit service scripts for openssh"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
depends=('openssh' 'runit')
provides=('init-openssh')
conflicts=('init-openssh')
source=("sshd.run")
sha256sums=('220dde8d4495bab6f08e063860c0ad54cc70ef8b7913a00e27126f1d5eb0af5f')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'sshd'
}
