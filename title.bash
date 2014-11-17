#!/bin/bash

dir=$(dirname $0)
[ -e "$dir/titles.txt" ] && rm $dir/titles.txt
[ -e "$dir/urls.txt" ] && rm $dir/urls.txt
for num in `seq 1 8`
do
  cat $dir/html/${num}.html | 
  grep 'くりぃむしちゅー' | 
  grep 'ANN' | 
  grep 'search_key_video' | 
  grep -v 'パンツ' |
  grep -v 'たとえて' | 
  grep -v 'まとめ' | 
  grep -v '番外編' | 
  grep -v '古坂大魔王' | 
  grep -v "エンディングテーマ" | 
  grep -v -E "(質問|上田|コーナー|楽しかった|日</a)" | 
  sed 's/.*href="\([^\"]*\)".*/\1/' | 
  sed 's;^;http://www.nicovideo.jp;' >> $dir/urls.txt


  cat $dir/html/${num}.html | 
  grep 'くりぃむしちゅー' | 
  grep 'ANN' | 
  grep 'search_key_video' | 
  grep -v 'パンツ' |
  grep -v 'たとえて' | 
  grep -v 'まとめ' | 
  grep -v '番外編' | 
  grep -v '古坂大魔王' | 
  grep -v "エンディングテーマ" | 
  grep -v -E "(質問|上田|コーナー|楽しかった|日</a)" | 
  sed 's/.*>\([^<]*\).*</\1/' | 
  sed 's;/a>;;' | 
  sed 's/♯/#/' | 
  tr '[０-９]' '[0-9]' | 
  sed 's/\[ラジオ\] //'|
  sed 's/のANN/ANN/' | 
  sed -e 's/第/#/' -e 's/回//' |
  sed -e 's/本当に最終ＳＰ//' | 
  sed 's/（最終回）//' | 
  sed 's/  / /' | 
  sed 's/[0-9][^ ]* //' >> $dir/titles.txt
done

paste -d"," $dir/titles.txt $dir/urls.txt | sort > $dir/urls_titles.txt
