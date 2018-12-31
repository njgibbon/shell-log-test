#!/bin/bash

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

#In our example input each log transaction is delimited by a "START LOG TYPE" and "END LOG TYPE". And identified by a unique ID number.
#Within the log extract various events are recorded.
#We want to run a test against each transaction recorded in the log. 
#We want to separate the transaction from the rest of the log and then assert against the "SUCCESS" keyword. 
#We assume that there could be any number of events output between the delimiting statements.

#Given we know what we want from the problem statement. First we go through the process we want to automate with manual shell commands. 

#1 Given the ID, take the log extract and save to a temporary file. 

#Find the line number of the ID
#cat log.txt | grep -n "001" | head -n 1 | cut -d: -f1
#3

#Find the line number of the start of the log extract. Cut the log at the ID. Then return the line number of the last instance of "START LOG TYPE".
#cat log.txt | head -n 3 | grep -n "START LOG TYPE" | tail -n 1 | cut -d: -f1
#2

#Find the line number of the end of the log extract. Cut the top of the log at the start line. Then return the first instance of "END LOG TYPE".
#cat log.txt | tail -n +2 | grep -n "END LOG TYPE" | head -n +1 | cut -d: -f1
#7

#Cut the log between the start and end lines and save this to a file. 
#cat log.txt | tail -n +2 | head -n +7 > logExtract.txt
#cat logExtract.txt
#START LOG TYPE
#ID 001
#EVENT A
#EVENT B
#EVENT C
#RESULT SUCCESS
#END LOG TYPE


#2 Now, Search for the "SUCCESS" keyword against the extract. Output number. If 0 then test failed. 
#cat logExtract.txt | grep -n "SUCCESS" | wc -l
#1

#This logic now just needs to be automated. See (this) main.sh for the solution. 
