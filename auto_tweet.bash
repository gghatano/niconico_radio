#!/bin/bash

dir=$(dirname $0)
num=$(ls $dir/contents | wc -l)
echo $num >> $dir/tweet.log.txt

while true
do
  content_num=$(echo $((RANDOM % $num)))
  content=$(cat $dir/contents/$content_num.txt | tr '\n' '%')
  
  cat $dir/radio_tweet.R | 
  sed "s;test;$content;" | 
  tr '%' '\n' > $dir/radio_tweet.R.test
  
  R -q -f $dir/radio_tweet.R.test > $dir/tmp/log.txt

  sleep 600
done

