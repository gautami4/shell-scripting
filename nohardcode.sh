#!/bin/bash

#check if root user is logged in

USERROOT=$(id -u)

LOGFOLDER="/var/log/shellscript-logs"
LOGFILE=$(echo $0 | cut -d "." -f1)
TIMESTAMPS=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILENAME="$LOGFOLDER/$LOGFILE-$TIMESTAMPS.log"



#function to check if pack installed or not
VALPACK(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ...  failure"
        exit 1
    else
        echo "$2 ... failure"
    fi
}

echo "The script started at :: $TIMESTAMPS" &>>$LOGFILENAME

if [ $USERROOT -ne 0  ]
then
    echo "You are not a root user"
    exit 1
fi

for packagess in $@
do
    dnf list installed $packagess. &>>$LOGFILENAME

    if [ $? -ne 0 ]
    then
    dnf list install $packagess -y     &>>$LOGFILENAME
        VALPACK $? "Installing $packagess"
      
    else
         
         echo "$packagess is already Installed"  
    fi    

done