function array_contains() {
    local needle=$1
    shift

    for ((i=1; i<=$#; i++)) {
        if [ "${!i}" == "$needle" ]; then
            return 0
        fi
    }
    return 1
}

# http://stackoverflow.com/a/10660730/2091470
function _rawurlencode() {
    local string="${1}"
    local strlen=${#string}
    local encoded=""
    local pos=0

    for (( ; pos<strlen ; pos++ )); do
       c=${string:$pos:1}
       case "$c" in
          [-_.~a-zA-Z0-9] )
              o="${c}"
          ;;
          * )
              printf -v o '%%%02x' "'$c"
          ;;
       esac
       encoded+="${o}"
    done
    eval "$2='$encoded'"
}

function _print_engines() {
    echo "Available engines:"
    for e in $(ls $SRCH_ENGINES/); do
        . "$SRCH_ENGINES/$e"
        echo -e "\t $e\t$DESCRIPTION"
        unset DESCRIPTION
    done
}
