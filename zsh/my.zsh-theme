local ret_status="%(?:%{$fg[yellow]%}Ϟ :%{$fg[red]%}Ϟ %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='$ret_status%{$fg[green]%}$(get_pwd)%{$reset_color%} '
RPROMPT='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}▼%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[blue]%}▲%{$reset_color%}"
