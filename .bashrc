if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

export NVM_DIR="/Users/butuzgol/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
