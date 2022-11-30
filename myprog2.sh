#Write a shell script that takes a filename as parameter. 
#Then your program will create a story copying one line from each one of the files 
#named giris.txt, gelisme.txt, sonuc.txt randomly in that order and print them to the file whose name is the argument given to the
#program. If the file exists, ask user if she wants the file to be overwritten. The aforementioned
#files are given to you with the project description file.

#newFileName=$1

FILE=giris.txt

# get line count for $FILE (simulate 'wc -l')
lc=0
while read -r line; do
 ((lc++))
done < $FILE

# get a random number between 1 and $lc
rnd=$RANDOM
let "rnd %= $lc"
((rnd++))

# traverse file and find line number $rnd
i=0
while read -r line; do
 ((i++))
 [ $i -eq $rnd ] && break
done < $FILE

# output random line
printf '%s\n' "$line" > $1

FILE2=gelisme.txt

# get line count for $FILE (simulate 'wc -l')
lc=0
while read -r line; do
 ((lc++))
done < $FILE2

# get a random number between 1 and $lc
rnd=$RANDOM
let "rnd %= $lc"
((rnd++))

# traverse file and find line number $rnd
i=0
while read -r line; do
 ((i++))
 [ $i -eq $rnd ] && break
done < $FILE2

# output random line
printf '%s\n' "$line" >> $1

FILE3=sonuc.txt

# get line count for $FILE (simulate 'wc -l')
lc=0
while read -r line; do
 ((lc++))
done < $FILE3

# get a random number between 1 and $lc
rnd=$RANDOM
let "rnd %= $lc"
((rnd++))

# traverse file and find line number $rnd
i=0
while read -r line; do
 ((i++))
 [ $i -eq $rnd ] && break
done < $FILE3

# output random line
printf '%s\n' "$line" >> $1
