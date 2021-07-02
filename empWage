#!/bin/bash -x
empCheck=$((RANDOM%3))
empRatePerHr=20

case $empCheck in
	1) empHrs=8
	;;
	2) empHrs=4
	;;
	*) empHrs=0
	;;
esac
salary=$(($empRatePerHr*$empHrs))
echo $salary
