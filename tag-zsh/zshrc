if [[ "$PROFILE_STARTUP" == true ]]; then
  startlog=/tmp/startlog.$$
  PS4='%D{%s.%6.} %N:%i> '
  exec 3>&2 2> >(tee "$startlog")
  setopt xtrace prompt_subst
fi

source ~/.zprezto/init.zsh
source ~/.zshalias

if [ -d ~/Dropbox/dotfiles ]; then
  for f in ~/Dropbox/dotfiles/*.sh; do
    source "$f"
  done
fi

[ -e ~/.peco/peco.sh ] && source ~/.peco/peco.sh
[ -e /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)
[ -e /usr/local/opt/rbenv/completions/rbenv.zsh ] && source /usr/local/opt/rbenv/completions/rbenv.zsh
[ -e /usr/lib/rbenv/completions/rbenv.zsh ] && source /usr/lib/rbenv/completions/rbenv.zsh

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

function c() {
  local repo="$(ghq list --full-path | sed -e "s,$DEV_SRC/,,g" | peco --select-1)"
  [[ -n "$repo" ]] && cd "$DEV_SRC/$repo"
}

function m() {
  if (( $# == 0 )); then
    nvim .
  else
    nvim "$@"
  fi
}

function gx() {
  gitg &!
}

function kubediff() {
  local kubediff_dir="$DEV_SRC/github.com/weaveworks/kubediff"
  "$kubediff_dir/venv/bin/python" "$kubediff_dir/kubediff" "$@"
}

function wp() {
  local wallpaper_dir="$XDG_DATA_HOME/wp"
  local wp_dir="$DEV_SRC/github.com/hugogrochau/wp"
  mkdir "$wallpaper_dir"
  source ~/.venv/wp/bin/activate
  pushd "$wp_dir" &> /dev/null
  WALLPAPER_DIR="$wallpaper_dir" ./wp "$@"
  result=$?
  popd &> /dev/null
  deactivate
  return $result
}

eval "$(direnv hook zsh)"

if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
  echo "Wrote profiling info to $startlog" >&2
fi
