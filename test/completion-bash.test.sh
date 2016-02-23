. $TEST_DIR/../completion/bash.sh

function _run() {
    COMP_WORDS=( "$@" )
    COMP_CWORD=${#COMP_WORDS[@]}
    (( COMP_CWORD-- ))

    _srch
}

TST="List all engines"
_run ""
if ! array_contains github.com "${COMPREPLY[@]}"; then
    fail "github.com should be suggested: ${COMPREPLY[@]}"
fi

if ! array_contains youtube.com "${COMPREPLY[@]}"; then
    echo "${COMPREPLY[@]}"
    fail "youtube.com should be suggested: ${COMPREPLY[@]}"
fi

TST="List some engines"
_run "g"
if ! array_contains google.com "${COMPREPLY[@]}"; then
    fail "google.com should be suggested: ${COMPREPLY[@]}"
fi

if ! array_contains github.com "${COMPREPLY[@]}"; then
    echo "${COMPREPLY[@]}"
    fail "github.com should be suggested: ${COMPREPLY[@]}"
fi
