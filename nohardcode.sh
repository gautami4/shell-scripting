#!/bin/bash

#check if root user is logged in

USERROOT=$(id -u)

LOGFOLDER="/var/log/shellscript-logs"
LOGFILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
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


if [ $USERROOT -ne 0  ]
then
    echo "You are not a root user"
    exit 1
fi

for packagess in $@
do
    dnf list installed $packagess
    echo " status is : $?" 
    if [ $? -ne 0 ]
    then
        dnf list install $packagess -y  &>>$LOGFILENAME
        
        VALPACK $? "Installing $packagess"

    else 
        echo " $packagess is already Installed" 
    fi    

done