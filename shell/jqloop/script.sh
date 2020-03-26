#!/bin/bash

export $(cat .env)
echo $SOURCE_TOKEN

json=$(cat sample.json)
len=$(echo $json | jq length)

echo $json
echo $len

for i in $( seq 0 $(($len - 1)) ); do
    row=$(echo $json | jq .[$i])
    
    name=$(echo $row | jq '.name')
    source=$(echo $row | jq '.source')
    destination=$(echo $row | jq '.destination')
    echo $name 
    echo $source
    echo $destination
done
