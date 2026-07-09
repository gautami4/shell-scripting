#!/bin/bash

# install mysql client

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...Failure" 
        exit 1
    else
        echo "$2...success" 
    fi 
}

#CHECK IF ROOT USER OR NOT
if [ $USERID -ne 0 ]
then
    echo "You should have sudo access to execute the script"
    exit 1 #give any number other than zero
fi 

#INSTALLING MYSQL
dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y

    VALIDATE $? "Installing Mysql"  #calling function and passing args
    
else
    echo "MYSQL already installed"
fi          
#INSTALLING GIT

dnf list installed git

if [ $? -ne 0]
then
    dnf install git -y
    VALIDATE $? "Installin Git"
else
    echo "Git already installed"
fi             