#!/bin/bash

Date=$(date +%F)
Script_name=$0
#implementation of log file
Logfile=/tmp/$Script_name-$Date.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validate(){
       if [ $1 -ne 0 ]
    then
    echo -e " $2... $R  Failure $N"
    else
    echo -e "$2..  $G Success $N"
    else
    echo -e "$2.. $Y Package already installed $N" 

    fi
   
}
UserID=$(id -u)
    if [ $UserID -ne 0 ]
    then
    echo " error execute the file with root access"
    exit 1
    fi
    
for i in git postfix mysql
    do
    yum install $i -y &>>$Logfile
    done
    Validate $? "$i"

    
