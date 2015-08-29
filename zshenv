export BREW_PREFIX="$(brew --prefix)"
export HIVE_HOME="$BREW_PREFIX/opt/hive/libexec"
export JAVA_HOME="$(/usr/libexec/java_home)"
export DOTFILES_HOME="$HOME/.dotfiles"

export AWS_REGION="eu-west-1"

export PGDATA="/usr/local/var/postgres/data"

export REDIRECT_LOG="no"

export DOCKER_HOST="tcp://192.168.59.103:2376"
export DOCKER_CERT_PATH="$HOME/.boot2docker/certs/boot2docker-vm"
export DOCKER_TLS_VERIFY=1
export _Z_CMD="j"

export GOROOT="$BREW_PREFIX/opt/go/libexec"
export GOPATH="$HOME/.go"

export GIT_TEMPLATE_DIR="$HOME/.git_templates"
export BOOL_HOME="$HOME/dev/burt/bool"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="/usr/local/bin:/usr/local/sbin:$DOTFILES_HOME/bin:$PATH"
export EDITOR="mvim -f"
