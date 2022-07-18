function kubectx --argument-names context
  if test -n $context
    set --local kubectx_dir $XDG_CONFIG_HOME/kubectx/$context
    set --local kubectx_config $kubectx_dir/config

    set --global --export KUBECTX $context
    set --global --export KUBECONFIG $kubectx_config:$HOME/.kube/config

    if not test -f $kubectx_config
      mkdir -p $kubectx_dir
      sed -e "s/%CONTEXT%/$context/g" $XDG_CONFIG_HOME/kubectx/template > $kubectx_config
      chmod 400 $kubectx_config
    end

    bind -M insert \cd _kubectx_exit
    bind \cd _kubexit_exit
    bind -M visual \cd _kubexit_exit

    commandline --function repaint
  else
    echo "<context> must not be empty" >&2
    return 1
  end
end

function _kubectx_exit
  set --erase KUBECTX
  set --erase KUBECONFIG
  bind --erase -M insert \cd
  bind --erase \cd
  bind --erase -M visual \cd
  commandline --function repaint
end
