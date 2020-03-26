# jqloop & gitfeed

## 事前準備
GithubAccessTokenを.envに入れてください。
```
SOURCE_TOKEN=xxxxxxxxxxxxxxx
```

## 作業メモ
- tokenがあれば、ユーザー設定しなくてもcloneができるのか？
  - できる！
```
% docker run -it alpine-git  
..(tokenをexportして〜)..
/ # git clone https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-test.git
Cloning into 'git-feed-test'...
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.
``` 

- jsonをjqでいい感じに処理させる
  - できる！
```
 t-sataga@MBA  ~/git/tips/shell/jqloop   master ● 
-> % ./script.sh                                                                                                                                                    00:40:45 - 00:41:00
.
/Users/t-sataga/git/tips/shell/jqloop
21f4ac30330b750cb9269c409bb9d1a2a08467d3
[ { "name": "repo_sync1", "source": "https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-test.git", "destination": "https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-dist1.git" }, { "name": "repo_sync2", "source": "https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-test.git", "destination": "https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-dist1.git" } ]
2
repo_sync1
https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-test.git
https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-dist1.git
repo_sync2
https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-test.git
https://oauth2:${SOURCE_TOKEN}@github.com/easy-to-study/git-feed-dist1.git
```

