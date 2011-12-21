# bash-completion for rake tasks

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
_rake() {
  if [ -f Rakefile ]; then
    if [ ! -f ._rake~ ]; then
      rake --tasks 2>/dev/null | cut -d ' ' -f 2 > ._rake~
    fi
    COMPREPLY=($(compgen -W "`cat ._rake~`" -- ${COMP_WORDS[COMP_CWORD]}))
  fi
  return 0
}

complete -o default -o nospace -F _rake rake
