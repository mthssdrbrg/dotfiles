function _kubectx_search
  set --local selected (kubectl config get-contexts --output name | _fzf_wrapper $FZF_DEFAULT_OPTS)

  if string length --quiet -- $selected
    kubectx $selected
  end
end
