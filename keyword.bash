#!/bin/bash

dir=$(dirname $0)
[ -e "$dir/tmp/tds.txt" ] && rm $dir/tmp/tds.txt
ls $dir/keyword_htmls | while read line
do
  echo $line 
  cat $dir/keyword_htmls/$line | 
  hxnormalize  | 
  grep td | grep -v "http://www.w3.org" | 
  sed 's/^ *[^ ]//' | 
  sed 's/,/:/g' | 
  sed 's/td>//' | 
  grep -v "href" >> $dir/tmp/tds.txt
done

cat $dir/tmp/tds.txt | 
awk -v OFS="," '{print int((NR+3)/4), $0}' | 
awk -F ":" '{print $1}' | 
sed 's/,$/,ゲスト なし/' > $dir/tmp/res.txt

