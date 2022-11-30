#Write a shell script that moves all the files with write permission for user to a directory named writable. 
#This directory will be created under current working directory by your program.

#Check if writable directory exist or not (create)
if [ -f Writable ]
then
echo "Writable directory is exist. The files were copied into it."
else
mkdir Writable
fi

num=-1

#Looking at all the files in the folder and moved the files with write permission with the mv command
#with the num, we count the file number which is moved and print it 
for file in *
do
  if [ -w $file ]
  then
    ((num++))
    mv $file Writable
    
  fi
done

echo "$num files moved to writable directory. "

