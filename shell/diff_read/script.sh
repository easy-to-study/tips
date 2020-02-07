#!/bin/bash

i=0
cnt=`diff deployment_old.yaml deployment_new.yaml | wc -l`

diff deployment_old.yaml deployment_new.yaml | while read line 
do
    # diffだけを抽出する
    if [[ $line =~ .*\>.* ]] ||  [[ $line =~ .*\<.* ]] 
    then
        echo "LINE $cnt : $line"
    fi
done

echo -n "作業継続してよろしいですか？ [y/N]: "
read ANS

case $ANS in
  [Yy]* )
    # ここに「Yes」の時の処理を書く
    diff deployment_old.yaml deployment_new.yaml | while read line 
    do
        # 作業進捗を表現するところ
        progress=""
        if [ $cnt -eq $i ]
        then
            progress="$progress>"
        else
            if [ $i -le $cnt ]
            then
                progress="$progress-"
            else
                progress="$progress "
            fi
        fi
        P=`expr $i \* 100 / $cnt`
        echo -en " copying...  [$progress] $P %\r"
        sleep 1
        i=`expr $i + 1`
    done
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "処理中止しました"
    ;;
esac
