#!/bin/bash

set -x

a=85
b=100

if [ $a -gt $b ]
then 
	echo "a is greater than b"
else
	echo "b is greater"
fi
