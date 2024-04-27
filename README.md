```sh
curl -L -o "appimagetool-x86_64.AppImage" -C - "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage"
curl -L -o "brave-browser_1.65.123_amd64.deb" -C - "https://github.com/brave/brave-browser/releases/download/v1.65.123/brave-browser_1.65.123_amd64.deb"
curl -L -o "create.sh" -C - "https://raw.githubusercontent.com/necdetuygur/BraveGenerateAppImage/master/create.sh"

sudo chmod -R 755 ./appimagetool-x86_64.AppImage
sudo chmod -R 755 ./create.sh

./create.sh
```

create.sh source: https://askubuntu.com/a/1386542
