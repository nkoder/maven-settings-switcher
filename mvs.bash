_mvs() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  settings=`ls ~/.mvn-settings/files/`
  COMPREPLY=( $(compgen -W "$settings" -- $cur) )
}

complete -F _mvs mvs
