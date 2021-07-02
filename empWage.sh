#!/bin/bash -x
empRatePerHr=20
numOfworkingDays=20
totalSalary=0
for ((day=1;day<=$numOfworkingDays;day++))
do
	empCheck=$((RANDOM%3))
	case $empCheck in
		1) empHrs=8
		;;
		2) empHrs=4
		;;
		*) empHrs=0
		;;
	esac
	salary=$(($empRatePerHr*$empHrs))
	totalSalary=$(($totalSalary+$salary))
done
echo $totalSalary
© 2021 GitHub, Inc.
