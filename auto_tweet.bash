#!/bin/bash

dir=$(dirname $0)
num=$(ls $dir/contents | wc -l)
echo $num
content_num=$(echo $((RANDOM % $num)))

content=$(cat $dir/contents/$content_num.txt | tr '\n' '%')
echo $content

cat $dir/radio_tweet.R | 
sed "s;test;$content;" | 
tr '%' '\n' > $dir/radio_tweet.R.test

R -f $dir/radio_tweet.R.test

