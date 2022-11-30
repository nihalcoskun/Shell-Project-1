#Write a shell script that takes an integer argument. 
#Then your program should find the hexadecimal values for all prime numbers that are smaller than the argument.

#!/bin/bash

prime_1=0
number=$1
echo "Hexadecimal of 1 is 1"  
echo "Hexadecimal of 2 is 2"
for((i=3;i<=number;))
do
  for((j=i-1;j>=2;))
  do
    if [  `expr $i % $j` -ne 0 ] ; then
      prime_1=1
    else
      prime_1=0
      break
    fi
    j=`expr $j - 1`
  done
  if [ $prime_1 -eq 1 ] ; then
    BASE=16 # Hexadecimal.
    hexcvt ()
   {
   echo ""$i" "$BASE" o p" | dc
   # "o" sets radix (numerical base) of output.
   # "p" prints the top of stack.
   # See 'man dc' for other options.
   return
   } 
    
    echo -n "Hexadecimal of $i is " 
    hexcvt "$1" 
  fi
  
  i=`expr $i + 1`
done