function __k8s_cluster_search --description 'k8s cluster search'
  set --local selected (kubectl config get-contexts --output name | eval (__fzfcmd) $FZF_DEFAULT_OPTS)
  if string length -q -- $selected
    kubectx $selected
  end
end
