#!/bin/sh

for f in $*
do
	name=$(basename "$f" ".zip")
	dirname=$(dirname "$f")
	unzip -d "$dirname/$name" "$f"
done
