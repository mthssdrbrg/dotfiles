# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="sorin"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Some more juice for Java apps
jo() { env JAVA_OPTS="-Xmn512m -Xms2g -Xmx2g" "$@" }

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew github vi-mode z colored-man colorize knife)

fpath=(/usr/local/share/zsh-completions $fpath)

# Enable ^R emacs behaviour in vi-mode
bindkey '\C-R' history-incremental-search-backward

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

# Load the goodies
source $ZSH/oh-my-zsh.sh

# Terminal colors
source ~/bin/base16-tomorrow.dark.sh

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by travis gem
source ~/.travis/travis.sh

source ~/.zshalias
