. $TEST_DIR/../completion/bash.sh

function _run() {
    COMP_WORDS=( "$@" )
    COMP_CWORD=${#COMP_WORDS[@]}
    (( COMP_CWORD-- ))

    _srch
}

TST="List all engines"
_run ""
if ! array_contains ddg "${COMPREPLY[@]}"; then
    fail "ddg should be suggested: ${COMPREPLY[@]}"
fi

if ! array_contains yt "${COMPREPLY[@]}"; then
    echo "${COMPREPLY[@]}"
    fail "yt should be suggested: ${COMPREPLY[@]}"
fi

TST="List some engines"
_run "g"
if ! array_contains g "${COMPREPLY[@]}"; then
    fail "g should be suggested: ${COMPREPLY[@]}"
fi

if ! array_contains gh "${COMPREPLY[@]}"; then
    echo "${COMPREPLY[@]}"
    fail "gh should be suggested: ${COMPREPLY[@]}"
fi
