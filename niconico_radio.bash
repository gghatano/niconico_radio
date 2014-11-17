#!/bin/bash

dir=$(dirname $0)

for page in `seq 1 8`
do
  url="http://www.nicovideo.jp/search/%E3%81%8F%E3%82%8A%E3%81%83%E3%82%80%E3%81%97%E3%81%A1%E3%82%85%E3%83%BC+ANN?page=$page&sort=f&order=d"
  curl $url > $dir/html/${page}.html
done
