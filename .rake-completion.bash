# bash-completion for rake tasks
# rake -s -T 2>/dev/null | awk '{{print $2}}' > .rake

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
_rakecomplete() {
  COMPREPLY=($(compgen -W "`if [ -f .rake ]; then cat .rake; fi`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _rakecomplete rake
