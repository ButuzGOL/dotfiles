#!/bin/bash

dev="$HOME/Developer"
dotfiles="$dev/ButuzGOL/dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

linkDir() {
  for location in $(find $1 -name '.*'); do
    file="${location##*/}"
    file="${file%.sh}"
    link "$dotfiles/$location" "$HOME/$file"
  done
}

# Git
linkDir "./git"
linkDir "./zsh"

# Other
link "$dotfiles/.aliases" "$HOME/.aliases"
link "$dotfiles/.bashrc" "$HOME/.bashrc"
link "$dotfiles/.gemrc" "$HOME/.gemrc"

link "$dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

source ~/.bashrc
