ButuzGOL dotfiles
========

Your dotfiles are how you personalize your system. These are mine.

## Install

### Main
```
curl --silent https://raw.github.com/ButuzGOL/dotfiles/master/install.sh | sh
```

### OSX configs
```
sudo bash .osx
```

### Bootstrap new system
```
git clone --recursive https://github.com/ButuzGOL/dotfiles.git
cd dotfiles
bash bootstap.sh
```

## Structure
* `git` — git config files
* `sublime` — sublime config files
* `zsh` — zsh config files also themes
* `.` - other configs (.aliases, .bashrc, .gemrc, etc)

## Some stuff was taken from so (Many Thanks)
* [Paul Miller’s dotfiles](https://github.com/paulmillr/dotfiles)
* [Zach Holman's dotfiles](https://github.com/holman/dotfiles)
* [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
