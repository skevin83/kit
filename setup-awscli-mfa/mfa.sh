#!/bin/bash

# This uses MFA devices to get temporary (eg 12 hour) credentials.  Requires
# a TTY for user input.
#
# GPL 2 or higher

if [ ! -t 0 ]
then
  echo Must be on a tty >&2
  exit 255
fi

identity=$(aws sts get-caller-identity)
username=$(echo -- "$identity" | sed -n 's!.*"arn:aws:iam::.*:user/\(.*\)".*!\1!p')
if [ -z "$username" ]
then
  echo "Can not identify who you are.  Looking for a line like
    arn:aws:iam::.....:user/FOO_BAR
but did not find one in the output of
  aws sts get-caller-identity
$identity" >&2
  exit 255
fi

echo You are: $username >&2

mfa=$(aws iam list-mfa-devices --user-name "$username")
device=$(echo -- "$mfa" | sed -n 's!.*"SerialNumber": "\(.*\)".*!\1!p')
if [ -z "$device" ]
then
  echo "Can not find any MFA device for you.  Looking for a SerialNumber
but did not find one in the output of
  aws iam list-mfa-devices --username \"$username\"
$mfa" >&2
  exit 255
fi

echo Your MFA device is: $device >&2

echo -n "Enter your MFA code now: " >&2
read code

tokens=$(aws sts get-session-token --serial-number "$device" --token-code $code)

secret=$(echo -- "$tokens" | sed -n 's!.*"SecretAccessKey": "\(.*\)".*!\1!p')
session=$(echo -- "$tokens" | sed -n 's!.*"SessionToken": "\(.*\)".*!\1!p')
access=$(echo -- "$tokens" | sed -n 's!.*"AccessKeyId": "\(.*\)".*!\1!p')
expire=$(echo -- "$tokens" | sed -n 's!.*"Expiration": "\(.*\)".*!\1!p')

if [ -z "$secret" -o -z "$session" -o -z "$access" ]
then
  echo "Unable to get temporary credentials.  Could not find secret/access/session entries
$tokens" >&2
  exit 255
fi

echo 'Removing old mfa setting'
sed -i '' '/mfa/,$d' ~/.aws/credentials

echo 'Push new mfa token, key, id to credentials'
echo AWS_SESSION_TOKEN=$session
echo AWS_SECRET_ACCESS_KEY=$secret
echo AWS_ACCESS_KEY_ID=$access

echo [mfa] >> ~/.aws/credentials
echo aws_session_token=$session >> ~/.aws/credentials
echo aws_secret_access_key=$secret >> ~/.aws/credentials
echo aws_access_key_id=$access >> ~/.aws/credentials
echo "====================================================="
echo Keys valid until $expire >&2
echo "====================================================="
