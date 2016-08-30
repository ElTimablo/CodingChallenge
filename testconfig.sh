#!/bin/bash

if [ -z "$1" ]
then
  echo "Please provide an IP or hostname to test."
else
  result=`curl $1 | grep -i 'moved permanently'`
  if [ -z "$result" ]
  then
    echo "Page at $1 not found. Please check your configuration and try again."
  else
    echo "Page at $1 successfully redirected."
  fi
fi
