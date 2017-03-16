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

function install-ruby() {
  local version="$1"
  [[ -z "$version" ]] && echo "<VERSION> is required" >&2 && return 1
  if rbenv versions --bare --skip-aliases | grep -q "$version"; then
    echo "$version is already installed"
    return 0
  fi
  case "$version" in
    2.2.*)
      curl -fsSL https://gist.github.com/mislav/055441129184a1512bb5.txt | \
        rbenv install --patch "$version"
      ;;
    1.9.3*)
      curl -fsSL https://gist.github.com/FiveYellowMice/c50490693d47577cfe7e6ac9fc3bf6cf.txt | \
        rbenv install --patch "$version"
      ;;
    1.8*)
      echo "Don't even bother..." >&2
      return 1
      ;;
    *)
      rbenv install "$version"
      ;;
  esac
  RBENV_VERSION="$version" gem install bundler
  RBENV_VERSION="$version" rbenv rehash
}

eval "$(direnv hook zsh)"

if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
  echo "Wrote profiling info to $startlog" >&2
fi
