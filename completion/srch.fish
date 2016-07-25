set -l NM srch
set -l SRCH_DIR (readlink -f ~/.srch)

complete -c $NM -l help -s h -d 'Show help'

# Register engines
set -l pairs (bash -c "source $SRCH_DIR/lib/lib.sh; export SRCH_ENGINES=$SRCH_DIR/engines; _print_engines | tail -n+2")
for p in $pairs
  # break on whitespace
  eval set pair $p
  complete -c $NM -f -a $pair[1] -d "$pair[2..-1]"
end
