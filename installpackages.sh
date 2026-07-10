#!/bin/bash

#check if root user is logged in

USERROOT=$(id -u)

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
else
    dnf list installed ngnix
fi


if [ $? -eq 0 ]
then
    echo "ngnix already installed"
else
    dnf install ngnix -y

    VALPACK $? ngnix

    
fi


