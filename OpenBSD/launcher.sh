#!/bin/sh

SEARCH=/usr/local/share/applications/
EXT=.desktop

set -e

TARGET=`ls -1 "$SEARCH" | sed -e "s/\\\\$EXT$//" | fzf`
COMMAND=`cat "$SEARCH$TARGET$EXT" | grep "Exec=" | head -n1 | sed 's/ %[a-zA-Z]$//' | cut -d'=' -f2-`

exec $COMMAND
