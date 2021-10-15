#!/bin/bash

date
find . \( -path './src/test' -or -path './qa' \) -and -prune -or -type f \( -name "*.[ch]" -or -name "*.cc" -or -name "*.cpp" -or -name "*.hpp" \)  -print > cscope.files

#find . -type f -name *.cc >> cscope.files
#find . -type f -name *.C >> cscope.files
#find . -type f -name *.hh >> cscope.files

if [ $# -eq 1 ]; then
    # remove test related files
    echo "excludes some test files..."
    mv cscope.files cscope.files.full
    sed -e '/_test/d;/UnitTest/d;/crimson/d;/\/test\//d' cscope.files.full > cscope.files
    # rm -f cscope.files.full
fi

cscope -b


find  . -name \*.py -print | xargs etags

date


