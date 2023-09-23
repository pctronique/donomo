#!/bin/bash
while read line  
do   
   rm -R -f ${0%/*}/../$line
done < ${0%/*}/../.gitignore
