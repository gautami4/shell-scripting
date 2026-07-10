#!/bin/bash

# writing a new program to install packages if not installed already

# getting the user id 
USERID=$(id -u)

# write a function to do check whether package already installed

installchk(){
    if [ $1 -eq 0 ]; then
        echo  "$packages ... is already installed"    
    else
        dnf install $packages -y
        valchk $? $packages
    fi
 
}

# write a function to do install packages
valchk(){
    
        if [ $1 -eq 0 ]; then
            echo "$packages .. installed successfully"
            
        else
            
            echo "$packages .. installation failed"
        fi
}   


if [ $USERID -ne 0 ] ;then
    echo  "You are not root user so you dont have authority to install"
    exit 1
else
    for packages in $@ 
    do
        dnf list installed $packages  
        installchk $? $packages
    done
fi

