#!/bin/bash

uuid=$(id -u)

#check if user have root access
if [ $? -ne 0 ]
then
    echo "you should have root access to run this script"
    exit 1
fi 

if [ $? -eq 0 ]
then
    dnf list installed nginx
fi

if [ $? -eq 0 ]
then
    echo "nginx already installed"
else
    dnf install nginx

    if [ $? -eq 0 ]
    then
        echo "nginx installation success"
    else
        echo "ngix installation failure"
    fi        
fi
            

