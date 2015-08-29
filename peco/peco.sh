peco-history-widget() {
  LBUFFER=$(fc -lr 1 | peco | sed "s/ *[0-9*]* *//")
  zle redisplay
}

zle -N peco-history-widget
bindkey '^xr' peco-history-widget
bindkey '^x^r' peco-history-widget
