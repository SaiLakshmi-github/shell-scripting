#!/bin/bash

Date=$(date +%F)
Script_name=$0
#implementation of log file
Logdir="/home/centos/shell-scripting/Shellscripting/shellscriptlog"
Logfile=$Logdir/$Script_name-$Date.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validate(){
       if [ $1 -ne 0 ]
    then
    echo -e " installing $2... $R  Failure $N"
    else
    echo -e "installing $2..  $G Success $N"
     fi
   
}
UserID=$(id -u)
    if [ $UserID -ne 0 ]
    then
    echo " error execute the file with root access"
    exit 1
    fi
    
for i in $@
    do
        yum list installed $i &&>>$Logfile
        if [ $? -ne 0 ]
        then
        echo " $i is not installed..let's install it"
        yum install $i -y &&>>$Logfile
        Validate $? "$i"
        else
        echo -e "$Y $i is already installed $N"
        fi 
    done

    
