# Load Antigen
source ~/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle brew
antigen bundle colored-man
antigen bundle colorize
antigen bundle gem
antigen bundle git
antigen bundle ruby
antigen bundle rupa/z
antigen bundle vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell/oh-my-zsh themes/sorin

antigen apply

fpath=(/usr/local/share/zsh-completions $fpath)

# Terminal colors
source ~/bin/base16-tomorrow.dark.sh

# awscli zsh completion
source /usr/local/share/zsh/site-functions/_aws

source ~/.zshalias

# Enable ^R emacs behaviour in vi-mode
bindkey '\C-R' history-incremental-search-backward

# Some more juice for Java apps
function jo() { env JAVA_OPTS="-Xmn512m -Xms2g -Xmx2g" "$@" }

function flip() {
  perl -C3 -Mutf8 -lpe '$_=reverse;y/a-zA-Z.['\'',({?!\"<_;‿⁅∴\r/ɐqɔpǝɟƃɥıɾʞ|ɯuodbɹsʇnʌʍxʎzɐqɔpǝɟƃɥıɾʞ|ɯuodbɹsʇnʌʍxʎz˙],'\'')}¿¡,>‾؛⁀⁆∵\n/' <<< "$1"
}

function fuck() {
  CMD="pkill"
  which $CMD >/dev/null || CMD="killall"
  echo
  if [ "$1" "==" "off" ]; then
    shift
    FLIP=(' (ノಠ益ಠ)ノ彡' '(ノಠ-ಠ)ノ彡')
    SIG="-9"
  else
    [ "$1" "==" "you" ] && shift
    FLIP=(' (╯°□°）╯︵' '(ノ ゜Д゜)ノ ︵' '(ﾉಥДಥ)ﾉ︵' ' ヽ(`Д´)ﾉ︵' ' (ﾉಥ益ಥ）ﾉ ')
    SIG=""
  fi
  [ -z "$1" ] && { echo "┬─┬﻿ ノ( ゜-゜ノ) patience young grasshopper"; echo; return; }
  F=${FLIP[$RANDOM % ${#FLIP[@]} ]}
  if $CMD $SIG "$1"; then
    echo "$F$(flip $1)"; echo
  else
    echo "┬─┬﻿ ︵ /(.□. \）"; echo
  fi
}
function gt () {
  cd $(git rev-parse --show-cdup);
}

