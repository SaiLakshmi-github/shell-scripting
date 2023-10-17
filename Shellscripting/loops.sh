#!/bin/bash

$Date=$(date +%F)
$Script_name=$0
#implementation of log file
$Logfile=/tmp/$Script_name-$Date.log
Validate(){
       if [ $1 -ne 0 ]
    then
    echo " $2... is Failure"
    else
    echo "$2.. is Success"
    fi
   
}
UserID=$(id -u)
    if [ $UserID -ne 0 ]
    then
    echo " error execute the file with root access"
    exit 1
    fi
    
packages = postfix github mssql
for i in packages
{
    do
    yum install $i -y
    
}