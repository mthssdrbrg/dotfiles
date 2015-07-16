export BREW_PREFIX="$(brew --prefix)"
export HIVE_HOME="$BREW_PREFIX/opt/hive/libexec"
export JAVA_HOME="$(/usr/libexec/java_home)"

export EC2_HOME="$BREW_PREFIX/opt/ec2-api-tools/libexec"
export AWS_ELB_HOME="$BREW_PREFIX/opt/elb-tools/libexec"
export AWS_REGION="eu-west-1"

export PGDATA="/usr/local/var/postgres/data"

export JRUBY_OPTS="--1.9"
export REDIRECT_LOG="no"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export DOCKER_HOST="tcp://192.168.59.103:2376"
export DOCKER_CERT_PATH="$HOME/.boot2docker/certs/boot2docker-vm"
export DOCKER_TLS_VERIFY=1
export _Z_CMD="j"

export GOROOT="$BREW_PREFIX/opt/go/libexec"
export GOPATH="$HOME/.go"

export EDITOR="mvim -f"
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/Dev/burt/tools/bin:/usr/local/share/npm/bin:$GOPATH/bin:$PATH"

export GIT_TEMPLATE_DIR="$HOME/.git_templates"
