#!/bin/sh

str=""
dir="."

if [ $# -eq 0 ]
then
	echo "At least one parameter needed."
	exit 1
elif [ $# -eq 1 ]
then
	str="$1"
elif [ $# -eq 2 ]
then
	str="$1"
	dir="$2"
else
	echo "Too many parameters."
	exit 1
fi

find "$dir" -type f \( -iname Makefile -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.asm' -o -iname '*.s' -o -iname '*.java' \) -print0 \
	| xargs -0 grep -in --color=always "$str" | awk -F ':' 'BEGIN{OFS=":";} { first=$1; second=$2; third=$3; $1=$2=$3=""; print "micro " first " +" second ": " third""substr($0,3); }'
