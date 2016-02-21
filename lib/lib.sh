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
