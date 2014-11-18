#!/bin/bash

dir=$(dirname $0)
num=$(ls $dir/contents | wc -l)
echo $num >> $dir/log.txt

while true
do
  content_num=$(echo $((RANDOM % $num)))
  content=$(cat $dir/contents/$content_num.txt | tr '\n' '%')
  echo $content
  
  cat $dir/radio_tweet.R | 
  sed "s;test;$content;" | 
  tr '%' '\n' > $dir/radio_tweet.R.test
  
  R -f $dir/radio_tweet.R.test
  sleep 600
done

