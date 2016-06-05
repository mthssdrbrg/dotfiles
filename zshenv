export DOTFILES_HOME="$HOME/.dotfiles"
export BREW_PREFIX="/usr/local"
export HIVE_HOME="$BREW_PREFIX/opt/hive/libexec"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

export PGDATA="$BREW_PREFIX/var/postgres"

export _Z_CMD="j"

export GOROOT="$BREW_PREFIX/opt/go/libexec"
export GOPATH="$HOME/.go"

export GIT_TEMPLATE_DIR="$HOME/.git_templates"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="mvim -f"
export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$HOME/.bin:$PATH:$GOPATH/bin"
export HISTFILE="$HOME/.zhistory"
