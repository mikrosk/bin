#!/bin/sh

TOS=$HOME/atari/roms/32-bit/tos404.img
#TOS=$HOME/atari/aranym/emutos-512k-1.3/etos512uk.img

hatari \
	--confirm-quit no \
	--country uk \
	--layout us \
	--language uk \
	--fast-forward yes \
	--fast-forward-key-repeat no\
\
	--monitor vga \
	--mousewarp yes \
\
	--drive-a no \
	--drive-b no \
	--fastfdc yes \
\
	--memsize 14 \
	--ttram 64 \
\
	--tos "$TOS" \
\
	--machine falcon \
	--dsp off \
	--timer-d yes \
	--fast-boot yes \
\
	--cpulevel 3 \
	--cpuclock 32 \
	--compatible no \
	--data-cache no \
	--cpu-exact no \
	--addr24 no \
	--fpu 68882 \
	--mmu no \
\
	--mic no \
	--sound off \
\
	--debug-except autostart,bus \
	--bios-intercept yes \
	--conout 2 \
	--natfeats yes \
\
	$*

#	--trace os_base \
