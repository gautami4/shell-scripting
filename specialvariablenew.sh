#!/bin/bash

#special variables
echo "all var passed : $@"
echo "num of var passed : $# "
echo " present working dir : $PWD"
echo "home directory : $HOME"
echo "which script is executed : $0"
echo "who executed the script : $USER"
echo "exit status of last command  : $?"
echo "current script process id : $$"
sleep 60 &
echo "process id of last backgroud command :$!"