#
# Executes commands at login post-zshrc.

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  fortune -a
  print
fi

source ~/.bashrc
