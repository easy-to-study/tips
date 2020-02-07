#!/bin/bash

cnt=0
diff deployment_old.yaml deployment_new.yaml | while read line
do
    cnt=`expr $cnt + 1`

    if [[ $line =~ .*\>.* ]]
    then
        echo $line
    fi
    # echo "LINE $cnt : $line"


done 
