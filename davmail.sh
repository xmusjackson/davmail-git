#!/bin/sh
JAVA_OPTS="-Xmx512M -Dsun.net.inetaddr.ttl=60 -Djdk.gtk.version=2.2"

JAVA_VERS="$(archlinux-java get | sed 's/.*.*-\(.*\)-.*/\1/')"

# Check for java 8, This might need to be improved but java 8 doesn't support --version, only -version
if [ $JAVA_VERS -gt 9 ]; then
	JAVA_OPTS="$JAVA_OPTS --add-exports java.base/sun.net.www.protocol.https=ALL-UNNAMED"
fi

JFX_CLASSPATH=/usr/lib/jvm/default-runtime/lib/javafx-base.jar:/usr/lib/jvm/default-runtime/lib/javafx-controls.jar:/usr/lib/jvm/default-runtime/lib/javafx-fxml.jar:/usr/lib/jvm/default-runtime/lib/javafx-graphics.jar:/usr/lib/jvm/default-runtime/lib/javafx-media.jar:/usr/lib/jvm/default-runtime/lib/javafx-swing.jar:/usr/lib/jvm/default-runtime/lib/javafx-web.jar
DAVMAIL_HOME=/usr/share/davmail
#exec "$JAVA_HOME/bin/java" -jar "$DAVMAIL_HOME/davmail.jar" "$@"
SWT_GTK3=0 exec java $JAVA_OPTS -cp $DAVMAIL_HOME/davmail.jar:${JFX_CLASSPATH}:$DAVMAIL_HOME/lib/* davmail.DavGateway "$@"