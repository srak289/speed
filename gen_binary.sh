#!/bin/bash

if [[ $2 ]]; then
    CWD=$2
else
    CWD=`pwd`
fi

if [[ $1 == "--quiet" ]]; then
    dd bs=1024 count=1024 if=/dev/urandom of=$CWD/files/1MB.bin 2>/dev/null && \
    dd bs=1024 count=102400 if=/dev/urandom of=$CWD/files/100MB.bin 2>/dev/null && \
    dd bs=1024 count=1048576 if=/dev/urandom of=$CWD/files/1GB.bin 2>/dev/null && \
    exit 0
fi

echo "
Will generate
    $CWD/files/1MB.bin 
    $CWD/files/100MB.bin
    $CWD/files/1GB.bin
Continue y or n? [n]"
read IN

if [[ "$IN" = "" ]]; then
    IN='n'
fi

case $IN in
    'n')
        echo "Quitting..."
    ;;
    'y')
        echo "Generating files..." && \
        dd bs=1024 count=1024 if=/dev/urandom of=$CWD/files/1MB.bin && \
        echo "Done $CWD/files/1MB.bin " && \
        dd bs=1024 count=102400 if=/dev/urandom of=$CWD/files/100MB.bin && \
        echo "Done $CWD/files/100MB.bin " && \
        dd bs=1024 count=1048576 if=/dev/urandom of=$CWD/files/1GB.bin && \
        echo "Done $CWD/files/1GB.bin\n\nComplete."
    ;;
    *)
        echo "
                This script generates the .bin files for Speed.
                Please answer 'y' if you would like the files generated.
            "
    ;;
esac
