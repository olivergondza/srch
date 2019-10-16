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

function run_test() {
  echo ":: running $(basename "$1") ::" >&2
  . "$1"
}

. "$SRCH_DIR/lib/lib.sh"

if [ "$#" -gt 0 ]; then
  for i in "$@"; do
    run_test "$i"
  done
else
  for i in $(ls "$TEST_DIR"/*.test.sh); do
  	run_test "$i"
  done
fi

exit $failed
