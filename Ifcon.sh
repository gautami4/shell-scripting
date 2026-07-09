#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
   dnf list installed mysql
   if [ $? -eq 0 ]; then
      echo "mysql is already installed"
   else 
      dnf install mysql -y
      echo "mysql installed"
    fi
else
    echo "you dont have authority to install"
fi