#!/bin/sh

TOS=$HOME/atari/roms/16-bit/tos206uk.img
#TOS=$HOME/atari/aranym/emutos-512k-1.3/etos512uk.img

hatari \
	--confirm-quit no \
	--country uk \
	--layout us \
	--language uk \
	--fast-forward yes \
	--fast-forward-key-repeat no \
\
	--mousewarp yes \
\
	--borders yes \
\
	--drive-a yes \
	--drive-b no \
	--fastfdc yes \
\
	--memsize 4 \
\
	--tos "$TOS" \
\
	--machine ste \
	--timer-d yes \
	--fast-boot yes \
\
	--cpuclock 32 \
	--compatible no \
	--data-cache no \
	--cpu-exact no \
\
	--sound off \
\
	--debug-except autostart,bus \
	--bios-intercept yes \
	--conout 2 \
	--natfeats yes \
\
	$*

#	--trace os_base \
