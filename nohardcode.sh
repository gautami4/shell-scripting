#!/bin/bash

#check if root user is logged in

USERROOT=$(id -u)

LOGFOLDER=(/var/log/shellscript-logs)
LOGFILE=$(ECHO $0 | CUT -D "." -f1)
TIMESTAMPS=$(date)
LOGFILENAME="$LOGFOLDER/$LOGFILE-$TIMESTAMP.log"

#function to check if pack installed or not
VALPACK(){
    if [ $1 -eq 0 ]
    then
        echo "$2 ...  success"
    else
        echo "$2 ... failure"
    fi
}

echo "The script started at :: $TIMESTAMP" &>>$LOGFILENAME

if [ $USERROOT -ne 0  ]
then
    echo "You are not a root user"
    exit 1
fi

for packagess in $@
do
    dnf list installed $packagess

    if [ $? -ne 0 ]
    then
        dnf list install $packagess -y &>>$LOGFILENAME
        
        VALPACK $? "Installing $packagess"

    else "$packagess is already Installed" 
    
    fi    

done