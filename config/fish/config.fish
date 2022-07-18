# XDG_* variables
set --export --global XDG_CONFIG_HOME $HOME/.config
set --export --global XDG_DATA_HOME   $HOME/.local/share
set --export --global XDG_CACHE_HOME  $HOME/.cache
# DEV_* variables
set --export --global DEV_HOME $HOME/dev
set --export --global DEV_BIN  $DEV_HOME/bin
set --export --global DEV_SRC  $DEV_HOME/src
set --export --global DEV_PKG  $DEV_HOME/pkg

set --export --global DOTFILES_HOME $HOME/.dotfiles
set --export --global GOPATH $DEV_HOME
set --export --global GIT_TEMPLATE_DIR $HOME/.git_templates

set --export --global PATH $HOME/.krew/bin $DEV_BIN $HOME/.local/bin /opt/homebrew/opt/openssl@1.1/bin /opt/homebrew/opt/node@16/bin /opt/homebrew/bin $PATH

set --export --global FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow'
set --export --global ASDF_DATA_DIR $XDG_DATA_HOME/asdf
set --export --global ASDF_CONFIG_FILE $XDG_CONFIG_HOME/asdf/asdfrc
set --export --global RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/ripgreprc
set --export --global TF_PLUGIN_CACHE_DIR $XDG_CACHE_HOME/terraform/plugin-cache
set --export --global KUBECTL_EXTERNAL_DIFF colordiff
set --export --global EDITOR nvim
set --export --global HOMEBREW_NO_ENV_HINTS true

set --universal FZF_DEFAULT_OPTS --exact --color=fg:#d8dee9,bg:#2e3440,hl:#81a1c1 --color=fg+:#d8dee9,bg+:#2e3440,hl+:#81a1c1 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
set --universal FZF_LEGACY_KEYBINDINGS 0
set --universal GHQ_SELECTOR_OPTS $FZF_DEFAULT_OPTS
set --universal __done_min_cmd_duration 60000
set --universal __internal_os (uname)

set fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert
set fish_greeting

if status --is-interactive
  abbr --add --global g   'git'
  abbr --add --global gst 'git status'
  abbr --add --global gco 'git checkout'
  abbr --add --global gcp 'git cherry-pick'
  abbr --add --global gc  'git commit -v'
  abbr --add --global gd  'git diff'
  abbr --add --global gds 'git diff --staged'
  abbr --add --global gb  'git branch'
  abbr --add --global gw  'git worktree'
  abbr --add --global gap 'git add -p'

  abbr --add --global k   'kubectl'
  abbr --add --global kc  'kubectl'
  abbr --add --global ka  'kubectl apply -f'
  abbr --add --global kp  'kubectl proxy'
  abbr --add --global ke  'kubectl exec -it -n'
  abbr --add --global kl  'kubectl logs -f --tail=20 -n'
  abbr --add --global kgp 'kubectl get pods -n'

  abbr --add --global chmox 'chmod +x'
  abbr --add --global s     'sudo'
  abbr --add --global t     'tig --all'

  if string match --ignore-case --quiet "linux" __internal_os
    abbr --add --global scu 'systemctl --user'
    abbr --add --global sc  'sudo systemctl'
    abbr --add --global j   'journalctl'
    abbr --add --global ju  'journalctl --unit'
    abbr --add --global juu 'journalctl --user --unit'
    abbr --add --global mk  'makepkg -sricC'
    abbr --add --global pu  'sudo pacman -Syu'
    abbr --add --global yu  'yay -Syua'
  end

  if command --quiet direnv
    direnv hook fish | source
  end

  if command --quiet dircolors
    eval (dircolors -c $HOME/.dir_colors)
  end

  if test -e /opt/asdf-vm/asdf.fish
    source /opt/asdf-vm/asdf.fish
  end

  if test -e /opt/homebrew/opt/asdf/asdf.fish
    source /opt/homebrew/opt/asdf/asdf.fish
  end

  if command --quiet pyenv
    pyenv init - | source
  end
end

if status --is-login
  if command --quiet pyenv
    pyenv init --path | source
  end
end
