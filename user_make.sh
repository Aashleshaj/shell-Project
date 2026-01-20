#!bin/bash

#script should be execute with sudo/root access.

if [[ "${UID}" -ne 0 ]]
then
	echo "Please run with sudo or root."
	exit 1
fi

#user should provide atleast one argument

if [[ "$#" -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo 'Create a user with name USER_NAME and comments field of comment'
	exit 1

fi

#store 1st argument as user name
USER_NAME=$1
echo "$USER_NAME"

#In case of more than one argument
COMMENT="${@:2}"
echo "$comment"

#create a pasword
PASSWORD=$(date +%s%N)
echo "$PASSWORD"

#Create the user
useradd -c "$COMMENT" -m $USER_NAME

#check if user is successfully created or not
if [[ $? -ne 0 ]]
then 
	echo 'The account could not be created'
	exit 1
fi

#set the password for the user
echo "$USER_NAME:$PASSWORD" | chpasswd

#Check if password is successfully set or not
if [[ $? -ne 0 ]]
then
	echo "Password could not be set"
	exit 1
fi

#Display the username password host etc

echo
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo
echo "$(hostname)"




