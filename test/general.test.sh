export SRCH_DIR="$TEST_DIR/res/mock-srch/"

TST="Illegal srch dir"
err=$(SRCH_DIR=/tmp "$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi
if [[ "$err" != *"Illegal SRCH_DIR provided"* ]]; then
    fail "Illegal tool dir should be detected. Actual: $err"
fi

TST="Illegal engines dir"
err=$(SRCH_ENGINES=/no_such_dir "$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi
if [[ "$err" != *"Illegal SRCH_ENGINES provided"* ]]; then
    fail "Illegal engines dir should be detected. Actual: $err"
fi

TST="Illegal config file"
err=$(SRCH_CONFIG=/no_such_file "$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi
if [[ "$err" != *"Illegal SRCH_CONFIG provided"* ]]; then
    fail "Illegal config file should be detected. Actual: $err"
fi

TST="No search engine specified"
err=$("$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi
if [[ "$err" != *"No search engine specified"* ]]; then
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
out=$("$SRCH" print 1 2 3)
if [ $? != 0 ]; then
    fail "Command should succeed. Exit code $?"
fi
if [[ "$out" != 'first=1 second=2 all=1 2 3' ]]; then
    fail "Should start BROWSER with assembled url. Actual: $out"
fi

TST="Escape special chars"
out=$("$SRCH" print ':/?' '#[]' @ '!$' "&'()" '*+,;=')
if [ $? != 0 ]; then
    fail "Command should succeed. Exit code $?"
fi
if [[ "$out" != 'first=%3a%2f%3f second=%23%5b%5d all=%3a%2f%3f %23%5b%5d %40 %21%24 %26%27%28%29 %2a%2b%2c%3b%3d' ]]; then
    fail "Should start BROWSER with assembled url. Actual: $out"
fi
