#!/bin/bash -x
#costants
IS_FULLTIME=1
IS_PARTTIME=2
empRatePerHr=20
numOfworkingDays=20
MAX_HRS_IN_MONTH=100

#Variables
totalEmpHrs=0
totalWorkingDays=0

getWorkingHours(){
	case $1 in
      $IS_FULLTIME) empHrs=8
      ;;
      $IS_PARTTIME) empHrs=4
      ;;
      *) empHrs=0
      ;;
   esac
	echo $empHrs

}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $numOfworkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	workHours=$( getWorkingHours $empCheck )
	totalEmpHrs=$(($totalEmpHrs+$workHours))

done
Wage=$(($totalEmpHrs*$empRatePerHr))
echo $Wage

