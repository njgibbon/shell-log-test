#!/bin/bash

#function to obtain the section of the log we want in an automated fashion following the logic described
#Params: id = unique id to search for in the log
#Output: log extract saved to temporary file temp/logExtract.txt (overwritten per function call)
function obtainTargetLogExtract
{
    id=$1

    idLineNumber=$(cat log.txt | grep -n "$id" | head -n 1 | cut -d: -f1)
    echo "ID Line Number is: " $idLineNumber
    echo ""

    startLineNumber=$(cat log.txt | head -n $idLineNumber | grep -n "START LOG TYPE" | tail -n 1 | cut -d: -f1)
    echo "Start Line Number is: " $startLineNumber
    echo ""

    endLineNumber=$(cat log.txt | tail -n +$startLineNumber | grep -n "END LOG TYPE" | head -n +1 | cut -d: -f1)
    echo "End Line Number is: " $endLineNumber
    echo "This is the number of lines after the Start line number."
    echo ""

    cat log.txt | tail -n +$startLineNumber | head -n +$endLineNumber > temp/logExtract.txt
    echo "Log Extract is: "
    cat temp/logExtract.txt
    echo ""
}

#SetUp
id=$1 #argument passed in keyword to search for
echo "id to get extract "$id
obtainTargetLogExtract $id