function fish_prompt
  echo -n (set_color cyan)(prompt_pwd)

  if test -n "$KUBECTX" # in a kubectx 'shell'
    echo -n (set_color brred)' $ ' # red dollar sign
  else
    echo -n (set_color ffb86c)' $ ' # orange dollar sign
  end
end

function fish_right_prompt
  test $status != 0 ; and printf (set_color brred)"⏎ "

  if type -q kubectl
    set --local context (kubectl config current-context 2> /dev/null || :)

    if test -n "$context"
      echo -n (set_color cyan)"k8s:("(set_color brred)"$context"(set_color cyan)")"
    end
  end

  if git rev-parse 2> /dev/null
    printf (set_color cyan)" git:("
    git branch -qv | grep "\*" | string match -rq detached
      and set_color brmagenta
      or set_color brred
    git rev-parse --abbrev-ref HEAD 2> /dev/null
    printf (set_color cyan)")"
  end
end
