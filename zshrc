if [[ "$PROFILE_STARTUP" == true ]]; then
  startlog=/tmp/startlog.$$
  PS4='%D{%s.%6.} %N:%i> '
  exec 3>&2 2> >(tee "$startlog")
  setopt xtrace prompt_subst
fi

# Load Prezto
source ~/.zprezto/init.zsh

fpath=(/usr/local/share/zsh-completions $fpath)

source "$HOME/Dropbox/dotfiles/burt.sh"
source ~/.zshalias
source ~/.peco/peco.sh
source /usr/local/opt/rbenv/completions/rbenv.zsh

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

function gt() {
  cd $(git rev-parse --show-cdup);
}

function cqlsh() {
  local version="$1"
  if [[ -z "$version" ]]; then
    docker exec -it cassandra cqlsh
  else
    docker exec -it "cassandra$version" cqlsh
  fi
}

function mongo() {
  local version="$1"
  if [[ -z "$version" ]]; then
    docker exec -it mongo mongo
  else
    docker exec -it "mongo$version" mongo
  fi
}

fuction redis-cli() {
  local version="$1"
  if [[ -z "$version" ]]; then
    docker exec -it redis redis-cli
  else
    docker exec -it "redis$version" redis-cli
  fi
}

function zkcli() {
  local version="$1"
  if [[ -z "$version" ]]; then
    docker exec -it zookeeper /opt/zookeeper/bin/zkCli.sh
  else
    docker exec -it "zookeeper$version" /opt/zookeeper/bin/zkCli.sh
  fi
}

function c() {
  cd "$DEV_SRC/$(ghq list --full-path | sed -e "s,$DEV_SRC/,,g" | peco --select-1)"
}

if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
  echo "Wrote profiling info to $startlog" >&2
fi
