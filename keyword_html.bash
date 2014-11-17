#!/bin/bash

dir=$(dirname $0)

for num in `seq 1 6`
do
  url="http://kamiyasu.net/creamstew/index.php?page=$num"
  curl $url > $dir/keyword_htmls/$num.html
done
