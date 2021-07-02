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

declare -A empDailyWage
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

calculateDailyWage(){
	local workHrs=$1
	wage=$(($empRatePerHr*$workHrs))
	echo $wage
}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $numOfworkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	workHours=$( getWorkingHours $empCheck )
	totalEmpHrs=$(($totalEmpHrs+$workHours))
	empDailyWage[$totalWorkingDays]=$( calculateDailyWage $workHours )

done
Wage=$(($totalEmpHrs*$empRatePerHr))
empDailyWage[Total Wage]=$Wage
echo Total Wage :: $Wage
echo "Day :: " sort ${!empDailyWage[@]}
echo "Daily Wage :: "${empDailyWage[*]}
