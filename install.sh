#!/bin/bash

function install_app_from_dmg {
  app=$1
  url=$2
  volumn_name="${3:-$app}" # default as app
  dmg_file="$app.dmg"
  app_folder="/Applications/$app.app"
  volumn_path="/Volumes/$volumn_name"

  if [ -d "$app_folder" ]; then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$dmg_file" ]; then
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

  if [ -d "$app_folder" ]; then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$bz_file" ]; then
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

  if [ -d "$app_folder" ]; then
    echo "$app aleady installed."
  else
    echo "Installing $app"

    # download dmg if it is not existed
    if [ -e "$pkg_file" ]; then
      echo "$pkg_file existed"
    else
      echo "download $pkg_file"
      curl -L -o "$pkg_file" "$url"
    fi

    sudo installer -verboseR -pkg "$pkg_file" -target /

    echo "$app has been installed."
  fi
}

function install_homebrew {

  if hash brew 2>/dev/null; then
    echo homebrew already installed.
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

function install_by_homebrew {
  app=$1

  if brew list -1 | grep -q "^${app}\$"; then
    echo $app already installed.
  else
    brew install "$app"
    echo "$app has been installed."
  fi
}

function install_oh_my_zsh {
  if [ -d ~/.oh-my-zsh ]; then
    echo oh_my_zsh already installed.
  else
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo oh_my_zsh has been installed.
  fi
}

function install_spf13 {
  if [ -e ~/.vimrc.local ]; then
    echo spf13 already installed.
  else
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
    echo spf13 has been installed.
  fi
}

function install_rvm {
  if [ -e ~/.rvm ]; then
    echo rvm already installed.
  else
    \curl -sSL https://get.rvm.io | bash -s stable
    echo rvm has been installed.
  fi
}

function install_for_atom {
  package=$1

  if apm ls | grep -q "${package}"; then
    echo "atom's package ->  $package already installed."
  else
    apm install "$package"
    echo "atom's package -> $package has been installed."
  fi
}

cd ~/Downloads

install_homebrew

install_app_from_dmg "Google Chrome" "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
install_app_from_dmg "FirefoxNightly" "https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-43.0a1.en-US.mac.dmg" "Nightly"
install_app_from_dmg "Spotify" "http://download.spotify.com/Spotify.dmg"
install_app_from_dmg "Skype" "http://www.skype.com/go/getskype-macosx.dmg"
install_app_from_dmg "Dropbox" "https://www.dropbox.com/download?plat=mac"
install_app_from_dmg "Sublime Text" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg"
install_app_from_dmg "SourceTree" "http://downloads.atlassian.com/software/sourcetree/SourceTree_2.0.5.2.dmg"
install_app_from_dmg "Evernote" "http://evernote.com/download/get.php?file=EvernoteMac"
install_app_from_dmg "Sequel Pro" "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg" "Sequel Pro 1.0.2"
install_app_from_dmg "Slate" "http://slate.ninjamonkeysoftware.com/Slate.dmg"

install_app_from_bz "FileZilla" "http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.9.0.6/FileZilla_3.9.0.6_macosx-x86.app.tar.bz2"
install_app_from_bz "Atom" "https://atom.io/download/mac"
install_app_from_bz "iTerm" "https://iterm2.com/downloads/stable/iTerm2-2_1_1.zip"

install_app_from_pkg "Docker" "https://github.com/docker/toolbox/releases/download/v1.8.2/DockerToolbox-1.8.2.pkg"

install_by_homebrew "htop"
install_by_homebrew "tree"
install_by_homebrew "watch"
install_by_homebrew "wget"
install_by_homebrew "tmux"
install_by_homebrew "nvm"
install_by_homebrew "git-flow"
install_by_homebrew "reattach-to-user-namespace"
install_by_homebrew "ansible"
install_by_homebrew "hub"

install_rvm

# zsh & oh_my_zsh
install_by_homebrew "zsh"
install_oh_my_zsh

# vim & spf13
install_by_homebrew "vim"
# sudo ln -fs /usr/local/bin/vim /usr/bin/vi
install_spf13

# Atom plugins
install_for_atom "autocomplete-ruby"
install_for_atom "Atom-Syntax-highlighting-for-Sass"
install_for_atom "highlight-selected"
install_for_atom "esformatter"
install_for_atom "jsformat"
install_for_atom "jshint"
install_for_atom "language-docker"
install_for_atom "linter"
install_for_atom "linter-jshint"
install_for_atom "merge-conflicts"
install_for_atom "minimap"
install_for_atom "minimap-find-and-replace"
install_for_atom "minimap-git-diff"
install_for_atom "minimap-highlight-selected"
