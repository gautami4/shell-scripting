#!/bin/bash

# install mysql client

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You should have sudo access to execute the script"
    exit 1 #give any number other than zero
fi    

dnf install mysqll -y

dnf install git -y