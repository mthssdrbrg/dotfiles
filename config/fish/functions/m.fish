function m
  if count $argv > /dev/null
    nvim $argv[1]
  else
    set -l select (eval (__fzfcmd) $FZF_DEFAULT_OPTS)
    if string length -q -- $select
      nvim $select
    end
  end
end
