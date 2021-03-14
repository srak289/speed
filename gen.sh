#!/bin/sh

dd bs=1024 count=1024 if=/dev/urandom of=/usr/share/nginx/html/files/1MB.bin 2>/dev/null && \
dd bs=1024 count=102400 if=/dev/urandom of=/usr/share/nginx/html/files/100MB.bin 2>/dev/null && \
dd bs=1024 count=1048576 if=/dev/urandom of=/usr/share/nginx/html/files/1GB.bin 2>/dev/null
