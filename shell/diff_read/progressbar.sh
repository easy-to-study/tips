#!/bin/bash

C=30
A=0
while [ $A -le $C ]
do
  B=""
  for i in `seq 1 $C`
  do
    if [ $A -eq $i ]
    then
      B="$B>"
    else
      if [ $i -le $A ]
      then
        B="$B-"
      else
        B="$B "
      fi
    fi
  done
  P=`expr $A \* 100 / $C`
  echo -en " copying...  [$B] $P %\r"
  sleep 1
  A=`expr $A + 1`
done
