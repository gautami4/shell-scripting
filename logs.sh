#!/bin/bash

# writing a new program to store logs of installed packages

# getting the user id 
USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d '.' -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$logs_folder/$log_file-$time_stamp.log"

# write a function to do check whether package already installed

installchk(){
    if [ $1 -eq 0 ]; then
        echo  "$packages ... is already installed"  &>>LOG_FILE_NAME 
    else
        dnf install $packages -y
        valchk $? $packages
    fi
 
}

# write a function to do install packages
valchk(){
    
        if [ $1 -eq 0 ]; then
            echo "$packages .. installed successfully at : $TIMESTAMP" &>>LOG_FILE_NAME
            
        else
            
            echo "$packages .. installation failed at : $TIMESTAMP" &>>LOG_FILE_NAME
        fi
}   


if [ $USERID -ne 0 ] ;then
    echo  "You are not root user so you dont have authority to install"
    exit 1
else
    for packages in $@ 
    do
        dnf list installed $packages  
        installchk $? $packages
    done
fi

