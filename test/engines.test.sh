export SRCH_CONFIG="$TEST_DIR/res/mock-srch/config"

TST="Use google.com"
out=$("$SRCH" g nee dle)
if [ $? != 0 ]; then
    fail "Command should succeed. Exit code $?"
fi

if [[ "$out" != 'https://www.google.com/search?q=nee dle' ]]; then
    fail "Should start BROWSER with assembled url. Actual: $out"
fi
