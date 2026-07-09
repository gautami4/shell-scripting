#!/bin/bash

#sample program for elif condition

SCORE=$1

if [ $SCORE -ge 90 ]
then
    echo "Grade : A"
elif [ $SCORE -ge 80 ]
then
    echo "Grade : B"
elif [ $SCOR -ge 70 ]
then
    echo "Grade : C"
else
    echo "Grade :D"
fi                