#!/bin/bash

NUMBER1=$1 # storing the values in variables by passing arguments
NUMBER2=$2

#Hear we are adding two numbers
SUM=$(($NUMBER1+$NUMBER2))

echo " sum of $NUMBER1 and $NUMBER2 is $SUM"

#print the time stamp when this script is executed
TIMESTAMP=$(date)

echo "Script executed at $TIMESTAMP"

