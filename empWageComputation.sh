wagePerHour=20
fullDayHours=8
halfDayHours=4
dailyWage=$((wagePerHour * fullDayHours))
partTimeWage=$((wagePerHour * halfDayHours))
absentCount=0
presentCount=0
halfDayPresentCount=0

count=0
totalHours=0
for(( i=1;i<=20;i++ ))
do
	attendanceCheck=$((RANDOM%3))
	case $attendanceCheck in
		0)
			absentCount=$((absentCount + 1))
			;;
		1)
			presentCount=$((presentCount + 1))
			totalHours=$((totalHours + 8))
			if [ $totalHours -eq 100 ]
			then
				break
			fi
			;;
		2)
			halfDayPresentCount=$((halfDayPresentCount + 1))
			totalHours=$((totalHours+4))
			if [ $totalHours -eq 100 ]
			then
				break
			fi
			;;
		*)
			echo "Invalid Output"
			;;
	esac
	count=$((count+1))
done
echo "Total Days Worked : $count"
echo "Total Hours Worked : $totalHours"
echo "Total number of days employee was absent : $absentCount"
echo "Total number of days employee was present for full day : $presentCount"
echo "Total number of days employee was present for half day : $halfDayPresentCount"
salaryCalculator=$((presentCount * dailyWage + halfDayPresentCount * partTimeWage))
echo "The Employee Salary for the month is : $salaryCalculator"