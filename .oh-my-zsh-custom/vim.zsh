export CERR_LOCATION=/tmp/compilation.errors
alias CERR="sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g' > $CERR_LOCATION"

