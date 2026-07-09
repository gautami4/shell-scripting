#!/bin/bash

# install mysql client

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You should have sudo access to execute the script"
fi    

dnf install mysqll -y

