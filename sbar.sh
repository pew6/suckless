#!/bin/bash


print_bat(){
	hash acpi || return 0
	onl="$(grep "on-line" <(acpi -V))"
	charge="$(awk '{ sum += $1 } END { print sum }' /sys/class/power_supply/BAT*/capacity)"
	if test -z "$onl"
	then
		echo -e "${charge}"
	else
		echo -e "${charge}"
	fi
}

print_date(){
	echo $(date "+%m-%d %H:%M")
}

while true
do

	xsetroot -name "$(print_bat) $(print_date)"
	sleep 2m
done
