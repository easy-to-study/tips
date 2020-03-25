#! /bin/sh

cp -R /tmp/.ssh /root/

exec "$@"

# exec /root/src/repo_sync.sh
# パスをどう変えても動かない。Pathのとおったところに配置してあげると動くかも？
