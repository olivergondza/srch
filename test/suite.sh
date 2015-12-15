TEST_DIR="$( cd "$( dirname "$0" )" && pwd )"
SRCH=$(readlink -f $TEST_DIR/../srch)

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

failed=0
function fail() {
	failed=1
	echo " - $TST" >&2
	echo -e "\t$1"
}

for i in $(ls $TEST_DIR/*.test.sh); do
	echo ":: running $(basename "$i") ::" >&2
	. "$i"
done

exit $failed
