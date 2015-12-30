#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.

echo 'Enter new hostname of the machine (e.g. macbook-butuzgol)'
  read hostname
  echo "Setting new hostname to $hostname..."
  scutil --set HostName "$hostname"
  compname=$(sudo scutil --get HostName | tr '-' '.')
  echo "Setting computer name to $compname"
  scutil --set ComputerName "$compname"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f $pub ]] || ssh-keygen -t rsa

echo 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f $pub ]] && cat $pub | pbcopy
  open 'https://github.com/account/ssh'

# Install homebrew and tweak system a bit.
which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew install git-extras
fi

echo 'Tweaking OS X...'
  source '.osx'

# http://github.com/sindresorhus/quick-look-plugins
echo 'Installing Quick Look plugins...'
  brew tap phinze/homebrew-cask
  brew install brew-cask
  brew cask install suspicious-package quicklook-json qlmarkdown qlstephen qlcolorcode

echo 'Symlinking config files...'
  source 'symlink.sh'

open_apps() {
  echo 'Install apps:'
  echo 'Dropbox'
  open https://www.dropbox.com
  echo 'Chrome'
  open https://www.google.com/chrome/browser/desktop/index.html
  echo 'Skype'
  open http://www.skype.com/en/download-skype/skype-for-computer/
  echo 'Transmission'
  open http://www.transmissionbt.com
  echo 'Slack'
  open https://itunes.apple.com/us/app/slack/id803453959?mt=12
  echo 'Atom'
  open https://atom.io/
  echo 'Timeout'
  open http://www.dejal.com/timeout/
}

echo 'Should I give you links for system applications (e.g. Skype, Chrome, etc)?'
echo 'n / y'
read give_links
[[ "$give_links" == 'y' ]] && open_apps
