#!/bin/bash
#makedailyfolders.sh
# a script to make a folder for each day of each month of a certain year
# mkdir of year
# mkdir for each month of year
# mkdir for each day of each month in year

#This was a quickie script.
#Could use lots of improvements...

YEAR=2020
SOURCEDIR=$HOME/Documents/Receipts/daily/$YEAR/

#Create year directory
mkdir $YEAR


#WORKS
#cd $SOURCEDIR
#mkdir -p $(seq -w 1 12)

#Create all month subdirectories for year directory
mkdir $(seq -f "$SOURCEDIR%02g" 1 12)

echo "============================="

#CREATE subdirectories for each day in month/year
for MONTH in 01 02 03 04 05 06 07 08 09 10 11 12
do

    #store variable for source directory and current looping month
    WORKMY=$SOURCEDIR$MONTH/
    #echo $WORKMY
    
    #Calculate last day of month and year
    LASTDAY=`cal $MONTH $YEAR | grep -Ev '^{2,}$' | tail -2|awk '{print $NF}'|grep -Ev '^{2,}$'|egrep -v "^(\r?\n)?$"|tail -1`
    #echo $LASTDAY

    mkdir $(seq -f "$WORKMY%02g" 1 $LASTDAY)

done
exit 0
