FROM alpine:3.8.5

#Install package of jq
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    jq \
    openssh \
    git

WORKDIR /root
COPY ./src ./src

ENTRYPOINT ["./src/docker-entrypoint.sh"]
CMD [ "/bin/sh" ]

# CMD ["repo_sync.sh"]
# ENTRYPOINTで呼ぼうとするがNotfoundに。これもPathの問題なのか・・？
