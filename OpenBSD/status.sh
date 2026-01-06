#!/bin/sh

trap 'exec $0' HUP
trap 'tput cnorm; echo ""; exit 1' INT QUIT TERM

tput civis
while true; do
	HOST=`sysctl -n kern.hostname`
	COLS=`stty size | cut -d' ' -f2`

	# Battery status
	BATS=`apm -a`
	BATP=`apm -l`
	BATT=`apm -m`
	case "$BATS" in
		0) BATS="remaining" ;;
		1) BATS="until full" ;;
	esac

	# Display Brightness
	BRT=`xbacklight | cut -d'.' -f1`

	# Processor freq
	PROCF=`sysctl -n hw.cpuspeed`
	PROCM=`apm -P`
	case "$PROCM" in
		0) PROCM="M" ;;
		1) PROCM="A" ;;
	esac

	TIME=`date "+%H:%M"`

	# Display

	LEFT="`printf "%s" "$HOST" | xargs`"
	MIDDLE="`printf "%s" "$TIME"`"
	RIGHT="`printf "PROC %sMHz (%s)  BRT %s%%  BAT %s%% (%s mins %s)" "$PROCF" "$PROCM" "$BRT" "$BATP" "$BATT" "$BATS"`"
	LEFTS=`echo -n "$LEFT" | wc -c`
	MIDDLES=`echo -n "$MIDDLE" | wc -c`
	RIGHTS=`echo -n "$RIGHT" | wc -c`

	P1="`dc -e "$COLS 2 / $MIDDLES 2 / - $LEFTS - p"`"
	P2="`dc -e "$COLS $LEFTS - $P1 - $MIDDLES - $RIGHTS - p"`"
	P1="`printf "%-${P1}s" ""`"
	P2="`printf "%-${P2}s" ""`"

	printf "\r%s%s%s%s%s" "$LEFT" "$P1" "$MIDDLE" "$P2" "$RIGHT"
	sleep 5
done
tput cnorm

