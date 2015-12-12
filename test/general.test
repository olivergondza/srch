BROWSER="echo"

TST="No search engine specified"
err=$("$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi

if [[ "$err" != *"No search term specified"* ]]; then
    fail "Command should fail with error. Actual: $err"
fi

TST="Engine does not exist"
err=$("$SRCH" no_such_engine 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi

if [[ "$err" != *"No engine 'no_such_engine' configured"* ]]; then
    fail "Command should fail with error. Actual: $err"
fi

TST="Run against engine"
out=$(CONFIG_DIR="$TEST_DIR/res/mock-engine/" "$SRCH" print 1 2 3)
if [ $? != 0 ]; then
    fail "Command should succeed. Exit code $?"
fi

if [[ "$out" != 'first=1 second=2 all=1 2 3' ]]; then
    fail "Should start BROWSER with assembled url. Actual: $out"
fi
