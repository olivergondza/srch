#!/bin/bash

TEST_DIR="$( cd "$( dirname "$0" )" && pwd )"
SRCH_DIR=$(readlink -f $TEST_DIR/..)
SRCH="$SRCH_DIR/srch"

failed=0
function fail() {
	failed=1
	echo " - $TST" >&2
	echo -e "\t$1"
}

. "$SRCH_DIR/lib/lib.sh"

for i in $(ls $TEST_DIR/*.test.sh); do
	echo ":: running $(basename "$i") ::" >&2
	. "$i"
done

exit $failed
