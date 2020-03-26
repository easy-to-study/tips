#!/usr/bin/bash


#ファイル読み込み
cat /app/github_to_partnergit.json | while true
do
read line1
read line2
read line3
read line4
read line5

if [ -z "$line1" ] ; then break
fi

#処理


#作業場に移動
cd work

#アカウントの設定
LOGIN_NAME=sataga

#環境変数からtoken取得
GITHUB_TOKEN_SOR=${SOURCE_KEY}
GITHUB_TOKEN_DES=${DESTINATION_KEY}

#JSONからリポジトリ情報を整形
SYNC_SOURCE=${line3#*:}
SYNC_DESTINATION=${line4#*:}
SYNC_SOURCE=${SYNC_SOURCE#*\"}
SYNC_DESTINATION=${SYNC_DESTINATION#*\"}

SYNC_SOURCE=${SYNC_SOURCE%\"*}
SYNC_DESTINATION=${SYNC_DESTINATION%\"*}

SYNC_SOURCE=$(eval echo ${SYNC_SOURCE})
SYNC_DESTINATION=$(eval echo ${SYNC_DESTINATION})

REPO_NAME=${line2#*:}
REPO_NAME=${REPO_NAME#*\"}
REPO_NAME=${REPO_NAME%\"*}


#デバッグ(あとで消す)
echo ""
echo $SYNC_SOURCE
echo $SYNC_DESTINATION

echo ""
echo $REPO_NAME
echo ""

#partner-gitリポジトリ設定
git clone $SYNC_DESTINATION
cd $REPO_NAME

#ZLabのgithubリポジトリを設定
git remote add SYNC_SOR_REPO $SYNC_SOURCE

#pull & push部
git pull SYNC_SOR_REPO

git merge --allow-unrelated-histories SYNC_SOR_REPO/master

git push -u origin master

cd ..

done
