#!/bin/bash

dir="$HOME/Playground"
mkdir -p $dir
cd $dir
git clone git://github.com/ButuzGOL/dotfiles.git
cd dotfiles
sudo bash symlink.sh
