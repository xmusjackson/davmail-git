# Contributor: Christian Hegerstroem <viking-dot-chris-at-live-dot-org>
# Maintainer: Christian Hegerstroem <viking-dot-chris-at-live-dot-org>
pkgname=davmail-git
pkgver=6.2.2.r40.g2938a7b
pkgrel=1
pkgdesc="a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mguessan/davmail"
license=('GPL2')
makedepends=('unzip' 'jdk8-openjdk' 'java8-openjfx' 'ant')
depends=('java-runtime')
provides=('davmail')
conflicts=('davmail')
optdepends=('java-openjfx: Office 365 browser based authentication'
            'swt: Fix issues with the tray icon')

source=("git+https://github.com/mguessan/davmail"
        ${pkgname%-git}.desktop
	${pkgname%-git}.sh
        ${pkgname%-git}@.system_service
        ${pkgname%-git}@.user_service)
md5sums=('SKIP'
         '1df37a6120d88de8df3cb735977336ba'
         'c45e3e771449b09566006c3e98367c74'
         '8d373851babe1d8bb860228c8b4db702'
         '271e9e66dfdb496d242c9a6102937c65')

pkgver() {
  cd davmail
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant compile-java jar
}

package() {
  install -d $pkgdir/{usr/share/${pkgname%-git}/lib,usr/bin,etc/${pkgname%-git}}
  install -Dm644 "${srcdir}"/${pkgname%-git}/dist/${pkgname%-git}.jar $pkgdir/usr/share/${pkgname%-git}/
  install -D "${srcdir}"/${pkgname%-git}/lib/* $pkgdir/usr/share/${pkgname%-git}/lib
  install -Dm755 "${srcdir}"/${pkgname%-git}.sh $pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}
  ln -s /usr/share/${pkgname%-git}/${pkgname%-git} $pkgdir/usr/bin/${pkgname%-git}
  install -Dm755 "${srcdir}"/${pkgname%-git}/src/etc/${pkgname%-git}.properties "${pkgdir}"/etc/${pkgname%-git}/${pkgname%-git}.properties
  install -Dm644 "${srcdir}"/${pkgname%-git}.desktop "${pkgdir}"/usr/share/applications/${pkgname%-git}.desktop
  install -Dm644 "${srcdir}"/${pkgname%-git}\@.system_service "${pkgdir}"/usr/lib/systemd/system/${pkgname%-git}\@.service
  install -Dm644 "${srcdir}"/${pkgname%-git}\@.user_service "${pkgdir}"/usr/lib/systemd/user/${pkgname%-git}\@.service

  # Create icons
  unzip -q "${srcdir}"/${pkgname%-git}/dist/${pkgname%-git}.jar tray.png tray32.png tray48.png tray128.png
  install -Dm644 tray.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/${pkgname%-git}.png
  install -Dm644 tray32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/${pkgname%-git}.png
  install -Dm644 tray48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/${pkgname%-git}.png
  install -Dm644 tray128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png
}
