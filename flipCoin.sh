#!/bin/bash -x

echo "Welcome To The Flip Coin"

read -p "How Many Coin You Want To Flip..?? " coin
read -p "How Many Time You Want To Flip..?? " num

declare -A flipDict

function getCoinValue()
{
local coinVal=""

	for (( i=0; i<$coin; i++ ))
	do

		flipResult=$((RANDOM%2))
		if [ $flipResult -eq 1 ]
		then
			coinVal=$coinVal"H"
		else
			coinVal=$coinVal"T"
		fi
	done

		echo $coinVal
}

function main()
{
	for (( j=0; j<$num; j++ ))
	do
		resultVal=$(getCoinValue)
		flipDict[$resultVal]=$(( ${flipDict[$resultVal]} + 1 ))
	done

	for result in ${!flipDict[@]}
	do
		echo ${flipDict[$result]}
		percentage=$(( ${flipDict[$result]} *100 / $num ))
		echo $result"	"$percentage"%"
	done | sort -k2 -nr | awk 'NR==1{print ($1"	"$2)}'
}
main
