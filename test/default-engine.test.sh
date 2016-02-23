TST="Default engine does not exists"
err=$(SRCH_CONFIG="$TEST_DIR/res/default-srch/invalid.config" "$SRCH" 2>&1)
if [ $? == 0 ]; then
    fail "Command should fail. Exit code $?"
fi
if [[ "$err" != *"SRCH_DEFAULT_ENGINE does not exist: no_such_engine"* ]]; then
    fail "Misconfigured default engine should be detected. Actual: $err"
fi

TST="Use default engine"
out=$(SRCH_DIR="$TEST_DIR/res/default-srch/" SRCH_CONFIG="$TEST_DIR/res/default-srch/print.config" "$SRCH" term 2>&1)
if [ $? != 0 ]; then
    fail "Command should succeed. Exit code $?"
fi
if [[ "$out" != "first=term second= all=term" ]]; then
    fail "Default engine should be used. Out: $out"
fi
