#!/bin/bash

#check if root user is logged in

USERROOT=$(id -u)

#function to check if pack installed or not
VALPACK(){
    if [ $1 -eq 0 ]
    then
        echo "$2 ... installed successfully"
    else
        echo "$2 ... installation failure"
    fi
}


if [ $USERROOT -ne 0  ]
then
    echo "You are not a root user"
    exit 1
fi

    dnf list installed nginx

if [ $? -eq 0 ]
then 
    echo "nginx already installed"
    exit 1
else
    dnf install nginx -y

    VALPACK $? nginx
fi


