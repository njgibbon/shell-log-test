#!/bin/bash
#source ./second.sh

#cat ../log.txt | grep -n "ID 003" | head -n 1 | cut -d: -f1

#cat ../log.txt | head -n 19 | grep -n "START LOG TYPE" | tail -n 1 | cut -d: -f1

#cat ../log.txt | tail -n +18 | grep -n "END LOG TYPE" | head -n +1 | cut -d: -f1

#var=$(cat ../log.txt | tail -n +18 | head -n +6)

#echo $var
function runner
{
    case1
    case2
    case3
    case4
    case5
}

function case1
{
    echo "Test Case 1"
    obtainTargetLogExtract "ID 001"
    checkTargetLogExtract "RESULT SUCCESS"
    
}

function case2
{
    echo "Test Case 2"
    obtainTargetLogExtract "ID 002"
    checkTargetLogExtract "RESULT SUCCESS"
}

function case3
{
    echo "Test Case 3"
    obtainTargetLogExtract "ID 003"
    checkTargetLogExtract "RESULT SUCCESS"
}

function case4
{
    echo "Test Case 4"
    obtainTargetLogExtract "ID 004"
    checkTargetLogExtract "RESULT SUCCESS"
}

function case5
{
    echo "Test Case 5"
    obtainTargetLogExtract "ID 005"
    checkTargetLogExtract "RESULT SUCCESS"
}

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

function checkTargetLogExtract
{
    stringToMatch=$1

    stringMatchNumber=$(cat temp/logExtract.txt | grep -n "$stringToMatch" | wc -l)
    echo "string matches = " $stringMatchNumber
    if [ $stringMatchNumber -eq 0 ]
    then
        echo "TEST FAILED"
        let "globalTestsFailed++"
    fi

}

#Set Up Vars

globalTests=5
globalTestsFailed=0
runner
echo $globalTestsFailed
