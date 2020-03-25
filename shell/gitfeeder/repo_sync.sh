#!/bin/bash

#############ここから#############
# デプロイしたいディレクトリの場所
deploy_path=/Users/t-sataga/git/tips/work
# デプロイするプロジェクトの名前
proj_name=git-feed-test
# リモートリポジトリのURL
remote_path=git://github.com:easy-to-study/git-feed-test.git
# デプロイするブランチ
branch=master
echo $deploy_path
echo $proj_name
echo $remote_path
echo $branch
#############ここまで#############
# # yes/noで応答
# function confirm () {
#     echo -n $1
#     read answer
#     case `echo $answer | tr y Y` in
#         Y*)
#         ;;
#         *)
#             echo "Bye."
#             exit
#         ;;
#     esac
# }

# # 本当にデプロイするか確認
# confirm "Is it OK to deploy? [y/n]"

# -AでSSH鍵をサーバーでも利用
# StrictHostKeyCheckingで初SSH接続時の[yes/no]を無視
# ssh -A -o StrictHostKeyChecking=no ${host}
# ssh -A -o StrictHostKeyChecking=no ${host} "
#     echo "proj_name check"
#     git clone ${remote_path} ${proj_name}
#     echo 'cloning success!'
# "

    git clone ${remote_path} ${proj_name}


# ssh -A -o StrictHostKeyChecking=no ${host} "
#     echo "proj_name check"
#     # プロジェクトのディレクトリがあるか確認
#     # なければclone、あればpullをおこなう
#     if [ ! -e ${proj_name} ]; then
#         git clone ${remote_path} ${proj_name}
#         echo 'cloning success!'
#     else
#         cd ${proj_name}
#         # pullもしくはfetch＆reset --hardを使う
#         # 競合を起こさないよう、強制的に最新のリモートリポジトリに合わせる
#         git fetch origin
#         git reset --hard origin/${branch}
#         # git pull origin ${branch}
#         echo 'deployment success!'
#     fi
# "
