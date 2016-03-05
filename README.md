# SRCH: Console based search engine manager

SRCH provide a flexible yet convenient way to perform any web search from a command line.

## Getting SRCH

Clone the repository into `.srch`. You will be able to `git pull` the updates easily.

    git clone git@github.com:olivergondza/srch.git ~/.srch

Make sure `~/.srch/srch` is either on the `$PATH` or there is a shell alias (`alias srch='~/.srch/srch'`). (The rest of the document expects the command can be called by `srch`.)

## Searching

To search using custom query, use `srch <ENGINE_NAME> SEARCH_QUERY`. The interpretation of `SEARCH_QUERY` in engine specific, by defaults it passes the query to the web search form as is. To preform github search for instance:

    srch github.com user:johndoe srch-fork

To discover what engines are available and what they do, run `srch` without any arguments.

## Autocompletion

To enable SRCH autocompletion source `~/.srch/completion/bash.sh` (for instance) from .bashrc. In case you are using custom alias, remember to register that alias for completion s well.

    . ~/.srch/completion/bash.sh
    # Create custom alias 's' and register it for autocompletion
    alias s='~/.srch/srch' && complete -o nospace -F _srch s

## Creating custom search engines

Whole configuration is stored in `$SRCH_DIR/engines/<ENGINE_NAME>`. You can create aliases to existing engines using symlinks like `ln -s github.com gh` and then use `gh` as an engine name.

To declare new engine it is needed to create new bash script that is expected to declare a couple of variables/functions:

#### `URL` (required)

Variable contains the URL pattern to be opened. All url encoded `SEARCH_QUERY` arguments are available via `$1`, `$2`, etc. as well as `$@`.

#### `DESCRIPTION` (required)

Variable with single line engine description to be displayed in engine listing.
