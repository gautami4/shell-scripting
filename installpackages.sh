#!/bin/bash

#check if root user is logged in

UID=$(id -u)

if [ $UID -ne 0  ]
then
    echo "You are not a root user"
    exit 1
else
    dnf list installed mysql
fi


if [ $? -eq 0 ]
then
    echo "Mysql already installed"
else
    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "mysql installed successfully"
    else
        echo " mysql installation failure"
    fi
fi


