TEST_DIR="$( cd "$( dirname "$0" )" && pwd )"
SRCH=$(readlink -f $TEST_DIR/../srch)

failed=0
function fail() {
	failed=1
	echo ":: $TST ::" >&2
	echo -e "\t$1"

}

for i in $(ls $TEST_DIR/*.test); do
	echo ":: running $(basename "$i")" >&2
	. "$i"
done

exit $failed
