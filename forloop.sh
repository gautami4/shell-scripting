#!/bin/bash

# writing a new program to install packages if not installed already

# getting the user id 
USERID=$(id -u)

if [ $USERID -ne 0 ] ;then
    echo  "You are not root user so you dont have authority to install"
    exit 1
fi
if [ $USERID -eq 0 ] ;then
    dnf list installed mysql 
    installchk $? MYSQL
fi

# write a function to do check whether package already installed

installchk(){
    if [ $1 -eq 0 ]; then
        echo  "$2 ... is already installed"    
    else
        dnf install mysql -y
        valchk $? $2
    fi
 
}

# write a function to do install packages
valchk(){
    
        if [ $1 -eq 0 ]; then
            echo "$2 .. installed successfully"
            
        else
            
            echo "$2 .. installation failed"
        fi
}   
