#!/bin/bash

#function to assert against a subset log extract file already obtained temp/logExtract.txt
#Params: stringToMatch = keyword we search for in the log extract, relativeProjectDir = path to execute from SoapUI Runner
#Output: Returns exit code 1 if no match found
function checkTargetLogExtract
{
    stringToMatch=$1
    relativeProjectDir=$2
 
    stringMatchNumber=$(cat $relativeProjectDir/temp/logExtract.txt | grep -n "$stringToMatch" | wc -l)
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
relativeProjectDir=$2 #argument passed in to find files we want to use relative to the execution of the project

echo "String to search for "$stringToMatch
checkTargetLogExtract $stringToMatch $relativeProjectDir