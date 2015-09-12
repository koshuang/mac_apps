#!/bin/bash

function install_app_from_dmg {
  app=$1
  url=$2
  volumn_name="${3:-$app}" # default as app
  dmg_file="$app.dmg"
  app_folder="/Applications/$app.app"
  volumn_path="/Volumes/$volumn_name"

  if [ -d "$app_folder" ]
  then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$dmg_file" ]
    then
      echo "$dmg_file existed"
    else
      echo "download $dmg_file"
      curl -L -o "$dmg_file" "$url"
    fi

    hdiutil mount -nobrowse "$dmg_file"
    cp -R "$volumn_path/$app.app" /Applications
    hdiutil unmount "$volumn_path"

    echo "$app has been installed."
  fi
}

function install_app_from_bz {
  app=$1
  url=$2
  bz_file="$app.app.tar.bz2"
  app_folder="/Applications/$app.app"

  if [ -d "$app_folder" ]
  then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$bz_file" ]
    then
      echo "$bz_file existed"
    else
      echo "download $bz_file"
      curl -L -o "$bz_file" "$url"
    fi

    tar -zxvf "$app.app.tar.bz2"
    mv "$app.app" /Applications

    echo "$app has been installed."
  fi
}

function install_app_from_pkg {
  app=$1
  url=$2
  pkg_file="$app.pkg"
  app_folder="/Applications/$app"

  if [ -d "$app_folder" ]
  then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$pkg_file" ]
    then
      echo "$pkg_file existed"
    else
      echo "download $pkg_file"
      curl -L -o "$pkg_file" "$url"
    fi

    sudo installer -verboseR -pkg "$pkg_file" -target /

    echo "$app has been installed."
  fi
}

cd ~/Downloads

install_app_from_dmg "Google Chrome" "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
install_app_from_dmg "FirefoxNightly" "https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-43.0a1.en-US.mac.dmg" "Nightly"
install_app_from_dmg "Spotify" "http://download.spotify.com/Spotify.dmg"
install_app_from_dmg "Skype" "http://www.skype.com/go/getskype-macosx.dmg"
install_app_from_dmg "Dropbox" "https://www.dropbox.com/download?plat=mac"
install_app_from_dmg "Sublime Text" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg"
install_app_from_dmg "SourceTree" "http://downloads.atlassian.com/software/sourcetree/SourceTree_2.0.5.2.dmg"
install_app_from_dmg "Evernote" "http://evernote.com/download/get.php?file=EvernoteMac"
install_app_from_dmg "Sequel Pro" "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg" "Sequel Pro 1.0.2"
install_app_from_bz "FileZilla" "http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.9.0.6/FileZilla_3.9.0.6_macosx-x86.app.tar.bz2"
install_app_from_bz "Atom" "https://atom.io/download/mac"
install_app_from_pkg "Docker" "https://github.com/docker/toolbox/releases/download/v1.8.2/DockerToolbox-1.8.2.pkg"
