#! /bin/bash -x

echo "Enter the value of a"
read a
echo "Enter the value of b"
read b
echo "Enter the value of c"
read c
val1=$((a+b*c))
echo "$val1"
val2=$((a*b+c))
echo "$val2"
val3=$((c+a/b))
echo "$val3"
val4=$((a%b+c))
echo "$val4"
echo $val1 $val2 $val3 $val4

result=( ["1"]=$val1 ["2"]=$val2 ["3"]=$val3 ["4"]=$val4 )
echo "The values stored in dictionary are : ${result[*]}"

for(( i=1;i<=${#result[*]};i++ ))
do
        array+=(${result[$i]})
done
echo "The values from dictionary are stored in arrays are : ${array[*]}"


for(( i=0;i<${#array[*]};i++ ))
do
        for(( j=$i;j<${#array[*]};j++ ))
        do
                if [ ${array[$i]} -lt ${array[$j]} ]
                then
                        temp=${array[$i]}
                        array[$i]=${array[$j]}
                        array[$j]=$temp
                fi
        done
done
echo "Sorted Array in descending order is : ${array[*]}"


for(( i=0;i<${#array[*]};i++ ))
do
        for(( j=$i;j<${#array[*]};j++ ))
        do
                if [ ${array[$i]} -gt ${array[$j]} ]
                then
                        temp=${array[$i]}
                        array[$i]=${array[$j]}
                        array[$j]=$temp
                fi
        done
done
echo "Sorted Array in ascending order is : ${array[*]}"