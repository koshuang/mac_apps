#!/bin/bash

mkdir ~/getmacapps_temp
cd ~/getmacapps_temp

# Installing Chrome
curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
hdiutil mount -nobrowse googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"
rm googlechrome.dmg

# Installing Firefox
curl -L -o Firefox.dmg "http://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
hdiutil mount -nobrowse Firefox.dmg
cp -R "/Volumes/Firefox/Firefox.app" /Applications
hdiutil unmount "/Volumes/Firefox"
rm Firefox.dmg

# Installing Spotify
curl -L -O "http://download.spotify.com/Spotify.dmg"
hdiutil mount -nobrowse Spotify.dmg
cp -R "/Volumes/Spotify/Spotify.app" /Applications
hdiutil unmount "/Volumes/Spotify"
rm Spotify.dmg

# Installing Skype
curl -L -O "http://www.skype.com/go/getskype-macosx.dmg"
hdiutil mount -nobrowse getskype-macosx.dmg
cp -R "/Volumes/Skype/Skype.app" /Applications
hdiutil unmount "/Volumes/Skype"
rm getskype-macosx.dmg

# Installing Dropbox
curl -L -o Dropbox.dmg "https://www.dropbox.com/download?plat=mac"
hdiutil mount -nobrowse Dropbox.dmg
cp -R "/Volumes/Dropbox Installer/Dropbox.app" /Applications
hdiutil unmount "/Volumes/Dropbox Installer"
rm Dropbox.dmg

# Installing Sublime Text 3 Beta
curl -L -o "Sublime Text 3.dmg" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg"
hdiutil mount -nobrowse "Sublime Text 3.dmg"
cp -R "/Volumes/Sublime Text/Sublime Text.app" /Applications
hdiutil unmount "/Volumes/Sublime Text/Sublime Text.app"
rm "Sublime Text 3.dmg"

# Installing Sequel Pro
curl -L -o sequel-pro.dmg "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg"
hdiutil mount -nobrowse sequel-pro.dmg
cp -R "/Volumes/Sequel Pro 1.0.2/Sequel Pro.app" /Applications
hdiutil unmount "/Volumes/Sequel Pro 1.0.2"
rm sequel-pro.dmg

# Installing Source Tree
curl -L -o SourceTree.dmg "http://downloads.atlassian.com/software/sourcetree/SourceTree_2.0.5.2.dmg"
hdiutil mount -nobrowse SourceTree.dmg
cp -R "/Volumes/SourceTree/SourceTree.app" /Applications
hdiutil unmount "/Volumes/SourceTree"
rm SourceTree.dmg

# Installing FileZilla
curl -L -o Filezilla.app.tar.bz2 "http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.9.0.6/FileZilla_3.9.0.6_macosx-x86.app.tar.bz2"
tar -zxvf Filezilla.app.tar.bz2
mv FileZilla.app /Applications
rm Filezilla.app.tar.bz2

# Installing Evernote
curl -L -o Evernote.dmg "http://evernote.com/download/get.php?file=EvernoteMac"
yes | hdiutil mount -nobrowse Evernote.dmg -nobrowse > /dev/null
cp -R "/Volumes/Evernote/Evernote.app" /Applications
hdiutil unmount "/Volumes/Evernote"
rm Evernote.dmg

