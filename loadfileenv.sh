#!/bin/bash

valuesenv=()

if [ -z "$1" ]
then
    echo "${valuesenv[@]}"
    exit 0;
fi

while read line  
do   
    line="$line" | xargs
    if [[ ! $line =~ ^# ]];
    then
        if [ ! -z "$line" ]
        then
            valuesenv+=("$line")
        fi
    fi
done < $1

echo "${valuesenv[@]}"

exit 0