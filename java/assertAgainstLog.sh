#!/bin/bash

#function to assert against a subset log extract file already obtained temp/logExtract.txt
#Params: stringToMatch = keyword we search for in the log extract
#Output: Returns exit code 1 if no match found
function checkTargetLogExtract
{
    stringToMatch=$1

    stringMatchNumber=$(cat temp/logExtract.txt | grep -n "$stringToMatch" | wc -l)
    echo "string matches = "$stringMatchNumber
    stringMatchNumber= "${stringMatchNumber// /}"
    echo $stringMatchNumber
    if [ $stringMatchNumber -eq 0 ]

    then
        echo "TEST FAILED"
        exit 1
    fi

}

#SetUp
stringToMatch=$1 #argument passed in keyword to search for
echo "String to search for "$stringToMatch
checkTargetLogExtract $stringToMatch