#!/bin/bash

# writing a new program to install packages if not installed already

# getting the user id 
USERID=$(id -u)

if [ $USERID -ne 0 ] ;then
  echo  "You are not root user so you dont have authority to install"
  exit 1
fi

# check whether package is already istalled
if [ $? -eq 0 ] ;then
    dnf list installed mysql 
    if [ $? -eq 0 ] ; then
        echo  " mysql is already installed"
        exit 1
    else
        dnf install mysql -y
        if [ $? -eq 0 ] ; then
            echo "mysql installed successfully"
        else
            echo "mysql installation failed"
        fi
    fi
fi