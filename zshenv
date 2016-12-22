export DOTFILES_HOME="$HOME/.dotfiles"
export BREW_PREFIX="/usr/local"
export HIVE_HOME="$BREW_PREFIX/opt/hive/libexec"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

export PGDATA="$BREW_PREFIX/var/postgres"

export _Z_CMD="j"

export DEV_HOME="$HOME/Dev"
export DEV_BIN="$DEV_HOME/bin"
export DEV_SRC="$DEV_HOME/src"
export DEV_PKG="$DEV_HOME/pkg"
export GOROOT="$BREW_PREFIX/opt/go/libexec"
export GOPATH="$DEV_HOME"

export GIT_TEMPLATE_DIR="$HOME/.git_templates"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="mvim -f"
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$HOME/.bin:$PATH:$DEV_BIN"
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
