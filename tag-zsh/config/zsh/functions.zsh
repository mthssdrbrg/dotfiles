function jo() {
  env JAVA_OPTS="-Xmn512m -Xms2g -Xmx2g" "$@"
}

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
  local repo
  repo="$(ghq list | peco --select-1)"
  [[ -n "$repo" ]] && cd "$DEV_SRC/$repo"
}

function m() {
  if (( $# == 0 )); then
    $EDITOR .
  else
    $EDITOR "$@"
  fi
}

function docker-cleanup() {
  set -x
  local -a containers images
  containers=($(docker ps --filter status=exited -q 2> /dev/null))
  docker rm "${containers[@]}" 2> /dev/null
  docker rm -v "${containers[@]}" 2> /dev/null
  images=($(docker images --filter dangling=true -q 2> /dev/null))
  docker rmi "${images[@]}" 2> /dev/null
}

function kubediff() {
  local -a configs mounts kubecfg
  configs=("${(@s/:/)KUBECONFIG}")
  for cfg in "${configs[@]}"; do
    md5_name=$(md5sum "$cfg" | cut -d' ' -f1)
    mounts+=(-v $cfg:/configs/$md5_name)
    kubecfg+=("/configs/$md5_name")
  done
  docker run -it --rm "${mounts[@]}" --entrypoint=/kubediff weaveworks/kubediff:master-771659d --kubeconfig="${(j.:.)kubecfg}"
}
