
# Show path before prompt
export PS1='%~ %# '

# Set iTerm 2 title to current directory
precmd() { print -Pn "\e]0;${PWD/#$HOME/~}\a" }
