#Write a shell script that takes two command line arguments, first one being a string and the second one being a number. 
#The number has to have a length of either 1 or same as the string. 
#Your program should then convert the input string into a ciphered one using this number. 
#For each letter in the string, your program has to find another letter in the English alphabet advancing over the alphabet corresponding digit times. 

#!/bin/bash
	
	if [[ -z $1 ]]
	then
		echo "There is no argument"
		exit 1
	fi
	
	strValue=$1
	#Checks if string entirely of char or not
	for ((i = 0; i < ${#strValue}; i++))
	do
		printf -v num %d "'${strValue:i:1}"
		if [[ $num -gt 96 ]] && [[ $num -lt 123 ]]
		then
		continue
		else
			echo "String armugent must be in between a-z"
			return 1
		fi
	done
	
	numberValue=$2
	#Checks the number is positive or not
	for ((i = 0 ; i < ${#numberValue} ; i++))
	do
		printf -v num %d "'${numberValue:i:1}"
		if [[ $num -gt 47 ]] && [[ $num -lt 58 ]]
		then
		continue
		else
			echo "Number argument must be positive"
			exit 1
		fi
	done
	#Checks the length of the string and number are equal 
	if [ ${#strValue} -ne ${#numberValue} ] && [ ${#numberValue} -ne 1 ]
	then
		echo "Length format is not acceptable!"
		exit 1
	fi
	
	#Translate all chars of string
	for ((i = 0; i < ${#strValue}; i++))
	do
	if [ ${#numberValue} -eq 1 ]
	then
		printf -v num %d "'${strValue:i:1}"
		if [ `expr $num + $numberValue` -gt 122 ]
		then
			num=`expr 96 +  $num + $numberValue - 122`
		else
		(( num += $numberValue))
		fi
		printf -v newchar \\$(printf '%03o' "$num")
		echo -n "$newchar"
	else
		printf -v num %d "'${strValue:i:1}"
		printf -v numOfNumber %d "'${numberValue:i:1}"
		printf -v newNumOfNumber \\$(printf '%03o' "$numOfNumber")
		if [ ` expr $num + $newNumOfNumber ` -gt 122 ]
		then
		num=`expr 96 +  $num + $newNumOfNumber - 122`
		else
		(( num += $newNumOfNumber ))
		fi
		printf -v newchar \\$(printf '%03o' "$num")
		echo -n "$newchar"
	fi
	done
echo ""	
