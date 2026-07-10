#!/bin/bash

# writing a new program to install packages if not installed already

# getting the user id 
USERID=$(id -u)

if [ $USERID -ne 0 ] ;then
  echo  "You are not root user so you dont have authority to install"
  exit 1
fi

Validate(){
    dnf list installed git 
    if [ $1 -eq 0 ] ; then
        echo  " $2 ..... already installed"
        exit 1
    else
        dnf install mysql -y
        if [ $1 -eq 0 ] ; then
            echo "$2 ..... installed successfully"
        else
            echo "$2 ..... installation failed"
        fi
    fi
}
# check whether package is already istalled
if [ $? -eq 0 ] ;then
    Validate $? git
fi