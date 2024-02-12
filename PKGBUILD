# Contributor: Christian Hegerstroem <viking-dot-chris-at-live-dot-org>
# Maintainer: Christian Hegerstroem <viking-dot-chris-at-live-dot-org>
_pkgpref=davmail
pkgname=davmail-git
pkgver=6.2.1.r19.g2caed4b
pkgrel=1
pkgdesc="a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mguessan/davmail"
license=('GPL2')
makedepends=('unzip' 'java-runtime' 'ant')
depends=('java-runtime')
conflicts=('davmail')
optdepends=('java-openjfx: Office 365 browser based authentication'
            'swt: Fix issues with the tray icon')

source=("git+https://github.com/mguessan/davmail"
        $_pkgpref.desktop
        $_pkgpref.sh
        $_pkgpref@.system_service
        $_pkgpref@.user_service)
md5sums=('SKIP'
         '1df37a6120d88de8df3cb735977336ba'
         '35ea07aab73479b72128cdd0a31a9083'
         '8d373851babe1d8bb860228c8b4db702'
         '271e9e66dfdb496d242c9a6102937c65')
pkgver() {
  cd davmail
  git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgpref
  ant compile-java jar
}

package() {
  install -d $pkgdir/{usr/share/java/$_pkgpref/lib,usr/bin,etc/$_pkgpref}
  install -Dm644 $srcdir/$_pkgpref/dist/$_pkgpref.jar $pkgdir/usr/share/java/$_pkgpref/
  install -D $srcdir/$_pkgpref/lib/* $pkgdir/usr/share/java/$_pkgpref/lib
  install -Dm755 $srcdir/$_pkgpref.sh $pkgdir/usr/share/java/$_pkgpref
  ln -s /usr/share/java/$_pkgpref/$_pkgpref.sh $pkgdir/usr/bin/$_pkgpref
  install -Dm644 $srcdir/$_pkgpref.desktop ${pkgdir}/usr/share/applications/$_pkgpref.desktop
  install -Dm644 $srcdir/$_pkgpref\@.system_service ${pkgdir}/usr/lib/systemd/system/$_pkgpref\@.service
  install -Dm644 $srcdir/$_pkgpref\@.user_service ${pkgdir}/usr/lib/systemd/user/$_pkgpref\@.service

  # Create icons
  unzip -q $srcdir/$_pkgpref/dist/$_pkgpref.jar tray.png tray32.png tray48.png tray128.png
  install -Dm644 tray.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/$_pkgpref.png
  install -Dm644 tray32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/$_pkgpref.png
  install -Dm644 tray48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$_pkgpref.png
  install -Dm644 tray128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgpref.png
}
