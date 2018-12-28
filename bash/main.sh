#!/bin/bash

#cat ../log.txt | grep -n "003" | head -n 1 | cut -d: -f1

#cat ../log.txt | head -n 19 | grep -n "START LOG TYPE" | tail -n 1 | cut -d: -f1

#cat ../log.txt | tail -n +18 | grep -n "END LOG TYPE" | head -n +1 | cut -d: -f1

#var=$(cat ../log.txt | tail -n +18 | head -n +6)


#Test Suite Execution Function
function runner
{
    case1
    case2
    case3
    case4
    case5
}

#Test Results saving and printing
#Output: log extract saved to temporary file temp/results.txt (overwritten per function call)
function results
{
    echo ""
    echo -e "Results: \nTest Passed: "$globalTestsPassed" / "$globalTests"\nTests Failed: "$globalTestsFailed" / "$globalTests > temp/results.txt
    cat temp/results.txt
}

#Tests
#Here is where we write the important values to be used in the execution and send them in as arguments
function case1
{
    echo "Test Case 1"
    obtainTargetLogExtract "ID 001"
    checkTargetLogExtract "SUCCESS"
    
}

function case2
{
    echo "Test Case 2"
    obtainTargetLogExtract "002"
    checkTargetLogExtract "SUCCESS"
    echo ""
}

function case3
{
    echo "Test Case 3"
    obtainTargetLogExtract "003"
    checkTargetLogExtract "SUCCESS"
    echo ""
}

function case4
{
    echo "Test Case 4"
    obtainTargetLogExtract "004"
    checkTargetLogExtract "SUCCESS"
    echo ""
}

function case5
{
    echo "Test Case 5"
    obtainTargetLogExtract "005"
    checkTargetLogExtract "SUCCESS"
    echo ""
}

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

#function to assert against a subset log extract file already obtained temp/logExtract.txt
#Params: stringToMatch = keyword we search for in the log extract
#Output: Returns none. Outcome is an increment of test passed or failed.
function checkTargetLogExtract
{
    stringToMatch=$1

    stringMatchNumber=$(cat temp/logExtract.txt | grep -n "$stringToMatch" | wc -l)
    echo "string matches = " $stringMatchNumber
    if [ $stringMatchNumber -eq 0 ]
    then
        echo "TEST FAILED"
        let "globalTestsFailed++"
    else
        echo "TEST PASSED"
        let "globalTestsPassed++"
    fi
}

#Start
#SetUp
globalTests=5 #nunber of tests to run
globalTestsFailed=0 #count of tests failed
globalTestsPassed=0 #count of tests passed
#Execution
runner #give control to test runner
#Results
results #result function



#Logic

