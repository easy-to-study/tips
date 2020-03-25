# buildするときにはろーかるの秘密鍵を使うことにしました。
- 参考：https://garicchi.com/?p=20935

```
# buildコマンド
docker run -v ~/.ssh/test:/tmp/.ssh

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
~ # 

```

