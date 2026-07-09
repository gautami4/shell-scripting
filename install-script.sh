#!/bin/bash

# install mysql client

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You should have sudo access to execute the script"
    exit 1 #give any number other than zero
fi 

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y

    if [ $? -ne 0 ]
    then
        echo "Installing MYSQL ...Failure" 
        exit 1
    else
        echo "Installing MYSQL ...success" 
    fi 
else
    echo "MYSQL already installed"
fi          

dnf list installed git

if [ $? -ne 0]
then
    dnf install git -y

    if [ $? -ne 0 ]
    then
        echo "Installing GIT ...Failue"
        exit 1
    else
        echo "Installing Git success"
    fi 
else
    echo "Git already installed"
fi             