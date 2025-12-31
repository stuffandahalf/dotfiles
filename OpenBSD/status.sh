#!/bin/sh

trap 'exec $0' HUP
trap 'tput cnorm; echo ""; exit 1' INT QUIT TERM

tput civis
while true; do
	HOST=`sysctl -n kern.hostname`

	# Battery status
	BATS=`apm -a`
	BATP=`apm -l`
	BATT=`apm -m`
	case "$BATS" in
		0) BATS="remaining" ;;
		1) BATS="until full" ;;
	esac

	# Processor freq
	PROCF=`sysctl -n hw.cpuspeed`
	PROCM=`apm -P`
	case "$PROCM" in
		0) PROCM="M" ;;
		1) PROCM="A" ;;
	esac

	TIME=`date "+%H:%M"`

	# Display
	clear
	printf "%s\tPROC %sMHz (%s)\tBAT %s%% (%s mins %s)\t%s" "$HOST" "$PROCF" "$PROCM" "$BATP" "$BATT" "$BATS" "$TIME"
	sleep 5
done
tput cnorm

