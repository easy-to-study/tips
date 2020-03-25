#!/bin/bash

#############ここから#############
# デプロイしたいディレクトリの場所(ローカルならDockerfileがあるところ)
deploy_path=`pwd`/src/work
# デプロイするプロジェクトの名前
proj_name=git-feed-test
# リモートリポジトリのURL
remote_path=git@github.com:easy-to-study/git-feed-test.git
# デプロイするブランチ
branch=master
#############ここまで#############
# yes/noで応答
function confirm () {
    echo -n $1
    read answer
    case `echo $answer | tr y Y` in
        Y*)
        ;;
        *)
            echo "Bye."
            exit
        ;;
    esac
}

# 本当にデプロイするか確認
confirm "Is it OK to deploy? [y/n]"

# Gitがあるか確認
if ! type 'git' > /dev/null 2>&1; then
    echo 'git not found...'
    exit 1
fi

# デプロイ場所が無かったら作成
if [ ! -e ${deploy_path} ]; then
    confirm 'Is it OK to create '${deploy_path}' dir?[y/n]'
    mkdir -p ${deploy_path}
fi

cd ${deploy_path}

# プロジェクトのディレクトリがあるか確認
# なければclone、あればpullをおこなう
if [ ! -e ${proj_name} ]; then
    git clone ${remote_path} ${proj_name}
    echo 'cloning success!'
else
    cd ${proj_name}
    # pullもしくはfetch＆reset --hardを使う
    # 競合を起こさないよう、強制的に最新のリモートリポジトリに合わせる
    git fetch origin
    git reset --hard origin/${branch}
    # git pull origin ${branch}
    echo 'deployment success!'
fi
