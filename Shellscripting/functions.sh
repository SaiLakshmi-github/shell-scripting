#!/bin/bash
Date=$(date +%F-%H-%M-%S)
Script_name=$0
Logfile=/tmp/$Script_name-$Date.log

Validate(){
    if [$1 -ne 0]
    then
    echo "$2...Failure"
    else
    echo "$2..Success"
fi
}
UserID=$(id -u)
if [$UserID -ne 0]
then
echo "Error:: please run this script with root access"
exit 1
fi
yum install mysql -y &>>$Logfile
Validate $? "installing mysql"
yum install postfix -y &>>$Logfile
Validate $? "installing Postfix"


