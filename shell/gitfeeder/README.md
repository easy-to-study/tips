# buildするときにはろーかるの秘密鍵を使うことにしました。
- 参考：https://garicchi.com/?p=20935

```
# docker コマンド
docker build -t gitfeeder 
docker run -it -v ~/.ssh/test:/tmp/.ssh 
```

# 参考までに動作ログ
```
 t-sataga@MBA  ~/git/tips/shell/gitfeeder   master 
-> % docker build -t gitfeeder .                                                                                                              08:32:06 - 08:32:13
Sending build context to Docker daemon  7.168kB
Step 1/6 : FROM alpine:3.8.5
 ---> c8bccc0af957
Step 2/6 : RUN apk update &&     apk upgrade &&     apk add --no-cache     jq     openssh     git
 ---> Using cache
 ---> 1ecbe69f6dae
Step 3/6 : WORKDIR /root
 ---> Using cache
 ---> 374ab440185f
Step 4/6 : COPY ./src ./src
 ---> 03173d45c292
Step 5/6 : ENTRYPOINT ["./src/docker-entrypoint.sh"]
 ---> Running in 3115eba47342
Removing intermediate container 3115eba47342
 ---> ad18f7ed0b82
Step 6/6 : CMD [ "/bin/sh" ]
 ---> Running in 8625a6166c1c
Removing intermediate container 8625a6166c1c
 ---> 206bfcd6d191
Successfully built 206bfcd6d191
Successfully tagged gitfeeder:latest
 t-sataga@MBA  ~/git/tips/shell/gitfeeder   master 
-> % docker run -it -v ~/.ssh/test:/tmp/.ssh gitfeeder                                                                                        08:32:14 - 08:32:19
 t-sataga@MBA  ~/git/tips/shell/gitfeeder   master 
-> % docker run -it -v ~/.ssh/test:/tmp/.ssh gitfeeder                                                                                        08:34:02 - 08:34:09
~ # sh src/repo_sync.sh 
Is it OK to deploy? [y/n]y
Cloning into 'git-feed-test'...
The authenticity of host 'github.com (13.114.40.48)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,13.114.40.48' (RSA) to the list of known hosts.
Enter passphrase for key '/root/.ssh/id_rsa': 
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 1), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), done.
Resolving deltas: 100% (1/1), done.
cloning success!
~ # 
```
