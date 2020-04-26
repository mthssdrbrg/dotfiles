function __terraform_env_search -d 'Terraform environment search'
  set --local prefix $TF_ENV_SEARCH_PREFIX
  set --local repositories $TF_ENV_SEARCH_REPOS
  set --local environments

  for repo in $repositories
    for env in $prefix/$repo/environments/*
      set -a environments $repo/(basename $env)
    end
  end

  set --local selected (string join \n $environments | eval (__fzfcmd) $FZF_DEFAULT_OPTS)

  if string length -q -- $selected
    set --local split (string split / $selected)
    set --local repo $split[1]
    set --local env $split[2]

    cd $prefix/$repo/environments/$env
  end

  commandline -f execute
end
