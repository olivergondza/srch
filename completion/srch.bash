: ${SRCH_DIR="$(readlink -f ~/.srch)"}

function _srch() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( )
    if [ $COMP_CWORD -lt 2 ]; then
        COMPREPLY=( $(compgen -W "$(ls $SRCH_DIR/engines/)" -- "$cur") )
    fi
    return 0
}

complete -F _srch srch
