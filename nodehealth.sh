#!/bin/bash

###########################################################
#Author: Priyanka
#Date: 24/11/2024
#
#This script outputs the node health
#
#Version: v1
###########################################################
#
set -x # debug mode
set -e # exit the script once thgere is an error
set -o pipefail

#set -exo pipefail

df -h

free -g

nproc

ps -ef

ps -ef | grep amazon | awk -F" " '{print $2}'
