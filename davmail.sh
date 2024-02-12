#!/bin/sh
DAVMAIL_HOME=/usr/share/java/davmail
SWT_GTK3=0
exec java -Xmx512M -Dsun.net.inetaddr.ttl=60 -Djdk.gtk.version=2.2 -cp /usr/share/java/davmail/davmail.jar:/usr/share/java/swt.jar:/usr/share/java/davmail/lib/* davmail.DavGateway
