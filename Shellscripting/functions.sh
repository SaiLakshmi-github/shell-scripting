#!/bin/bash
Date=$(date +%F-%H-%M-%S)
Script_name=$0
Logfile=/tmp/$Script_name-$Date.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Validate(){
    if [ $1 -ne 0 ]
    then
    echo -e "$2...$R Failure $N"
    else
    echo -e "$2..$G Success $N"
fi
}
UserID=$(id -u)
if [ $UserID -ne 0 ]
then
echo "Error:: please run this script with root access"
exit 1
fi
yum install mysql -y &>>$Logfile
Validate $? "installing mysql"
yum install postfix -y &>>$Logfile
Validate $? "installing Postfix"


