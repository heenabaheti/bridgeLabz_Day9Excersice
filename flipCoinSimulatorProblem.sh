#! /bin /bash -x
count=0
headCount=0
tailCount=0
tailHeadCount=0
headTailCount=0
read -p "How many times you want to flip a coin in loop: " num

for(( i=1;i<=${num};i++ ))
do
	coinResult=$((RANDOM%2))
	if [ $coinResult -eq 1 ]
	then
		headCount=$((headCount + 1))
		singlet[$i]="H"
	else
		tailCount=$((tailCount + 1))
		singlet[$i]="T"
	fi
	

done
echo ${singlet[*]}
echo "The total head count in singlet dictionary is : $headCount"
echo "The total tail count in singlet dictionary is : $tailCount"
echo "****************************************************"

headCountPercent=`echo "scale=2;($headCount*100)/$num" | bc`
tailCountPercent=`echo "scale=2;($tailCount*100)/$num" | bc`

echo "The percentage of head winning in singlet dictionary is : $headCountPercent %"
echo "The percentage of tails winning in singlet dictionary is : $tailCountPercent %"
echo "****************************************************"
singletFunc()
{
	for(( i=1;i<=${num};i++ ))
	do
		coinResult=$((RANDOM%2))
		if [ $coinResult -eq 1 ]
		then
			headCount=$((headCount + 1))
			singlet[$i]="H"
		else
			tailCount=$((tailCount + 1))
			singlet[$i]="T"
		fi

	done
	echo ${singlet[*]}
	echo "The total head count in singlet dictionary is : $headCount"
	echo "The total tail count in singlet dictionary is : $tailCount"
        echo "****************************************************"
	headCountPercent=`percentageCalculator $headCount`
	tailCountPercent=`percentageCalculator $tailCount`
	echo "The percentage of head winning in singlet dictionary is : $headCountPercent %"
	echo "The percentage of tails winning in singlet dictionary is : $tailCountPercent %"
        echo "****************************************************"
}

doubletFunc()
{
	headCount=0
	tailCount=0
	for(( i=1;i<=${num};i++ ))
	do
		for(( j=1;j<=2;j++ ))
		do
			coinResult=$((RANDOM%2))
			count=$((coinResult+count))
			if [ $j -eq 1 ]
			then
				firstFlip=$coinResult
			else
				secondFlip=$coinResult
			fi
		done
		if [ $count -eq 2 ]
		then
			headCount=$((headCount + 1))
			doublet[$i]="HH"
		elif [ $count -eq 0 ]
		then
			tailCount=$((tailCount + 1))
			doublet[$i]="TT"
		elif [ $count -eq 1 ]
		then
			if(( ${firstFlip}==0 && ${secondFlip}==1 ))
			then
				tailHeadCount=$((tailHeadCount + 1))
				doublet[$i]="TH"
			elif(( ${firstFlip}==1 && ${secondFlip}==0 ))
			then
				headTailCount=$((headTailCount + 1 ))
				doublet[$i]="HT"
			fi
		fi
		count=0
	done

	echo ${doublet[*]}
	echo "HH count : $headCount"
	echo "TT count : $tailCount"
	echo "HT count : $headTailCount"
	echo "TH count : $tailHeadCount"
        echo "****************************************************"
	headCountPercent=`percentageCalculator $headCount`
	tailCountPercent=`percentageCalculator $tailCount`

	headTailCountPercent=`percentageCalculator $headTailCount`
	tailHeadCountPercent=`percentageCalculator $tailHeadCount`

	echo "HH win percent in doublet dictionary : $headCountPercent %"
	echo "TT win percent in doublet dictionary : $tailCountPercent %"
	echo "HT win percent in doublet dictionary : $headTailCountPercent %"
	echo "TH win percent in doublet dictionary : $tailHeadCountPercent %"
        echo "****************************************************"
}


percentageCalculator()
{
	percent=`echo "scale=2;($1*100)/$num" | bc`
	echo $percent
}

echo -n "The result of flipping coin once is as follows: "
singletFunc
echo -n "The result of flipping coin twice is as follows: "
doubletFunc
