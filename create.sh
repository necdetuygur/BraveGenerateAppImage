#!/bin/bash -x

set +e
APP=Brave
patharch=x86_64
package="brave-browser_1.65.123_amd64.deb"
URL="https://github.com/brave/brave-browser/releases/"
if  [ ! -f $package ]; then
    wget -c $URL$package
else
    echo "$package file exists"
fi

mkdir -p ./$APP.AppDir
rm -rf ./$APP.AppDir/*
cd $APP.AppDir/
find ../ -name *.deb -exec dpkg -x \{\} . \;

cp opt/brave.com/brave/product_logo_48.png ./Brave.png
# find . -name $APP.desktop -exec cp \{\} . \;
# find -name $APP.png -exec cp \{\} . \;

cat > $APP.desktop <<EOF
[Desktop Entry]
Type=Application
Name=brave-browser
Exec=brave-browser %U
StartupNotify=true
Icon=Brave
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
EOF

mkdir -p usr/bin/
mv ./opt/brave.com/brave/* usr/bin/ ; rm -rf ./opt

AppRun="AppRun"

if  [ ! -f ../../$AppRun ]; then
    wget -c https://github.com/AppImage/AppImageKit/releases/download/continuous/AppRun-${patharch} -O AppRun
else
    cp ../../AppRun .
fi
chmod a+x AppRun

# generate_type2_appimage
cd ..
VERSION=""
VERSION=$VERSION ./appimagetool-x86_64.AppImage -v -n ./$APP.AppDir/

if [ -d "./$APP.AppDir/" ] ; then
  rm -rf ./$APP.AppDir
fi
