#!/bin/bash

# install mysql client


if [ (id -u) -eq 0 ]
then
    echo "Installing the MYSQL"

dnf install mysqll -y

else 
    echo " No access to install"
fi    