#Write a shell script that takes a wildcard as an argument and a pathname to a directory as an optional argument.
#If the user supplies only wildcard as an argument, then the program will ask user to delete every file whose name obeys the wildcard under current directory.
#If the user supplies both wildcard and pathname, then the program will all of its subdirectories. ask user to delete every file
#whose name obeys the wildcard under the given directory and all of its subdirectories.

#!/bin/bash   
# if path is given then delete oldest file in path 
# else delete the oldest file from current working directory 
if [ -n "$1" ] ; then        
   echo "Deleting file from $1"         
   # rm -i is for interactive delete , ls -t gives oldest file list          
   # which is piped to tail -1 which will give last file in the list         
   # which is the oldest         
   rm -i "$1/$(ls -t $1|tail -1)"     

   # $? will 0 if last command was successful          
   if [ $? -eq 0 ] ; then                 
    echo "1 file deleted"         
   fi  
else         
    echo "Deleting file from `pwd`"         
    rm -i "$(ls -t|tail -1)"         
    if [ $? -eq 0 ] ; then                 
      echo "1 file deleted"         
    fi
fi