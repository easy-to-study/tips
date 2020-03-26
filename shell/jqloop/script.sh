#!/bin/bash

echo `dirname $0`
SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo $SCRIPT_DIR


export $(cat .env)
echo $SOURCE_TOKEN

json=$(cat sample.json)
len=$(echo $json | jq length)

echo $json
echo $len

for i in $( seq 0 $(($len - 1)) ); do
    row=$(echo $json | jq .[$i])
    
    name=$(echo $row | jq -r '.name')
    source=$(echo $row | jq -r '.source')
    destination=$(echo $row | jq -r '.destination')
    
    echo $name 
    echo $source
    echo $destination

    # cd work
    # git clone $source
    # #pull & push部
    # git pull $source
    # git merge --allow-unrelated-histories $source/master

    # git push -u origin master
    

done

cd ..
