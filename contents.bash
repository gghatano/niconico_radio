#!/bin/bash

dir=$(dirname $0)
cat $dir/data.txt | while read line
do
  echo $line
  num=$(echo $line | cut -d"," -f 1)
  echo $num
  echo $line | 
  awk -F"," -v OFS="," '{print $2,$3,$6,$7}' | 
  tr ',' '\n' > $dir/contents/$num.txt
done
