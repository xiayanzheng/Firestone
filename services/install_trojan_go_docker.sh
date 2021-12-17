hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"trojan
mkdir -p /etc/lfapps/trojan
mkdir -p /etc/letsencrypt
mkdir -p /etc/letsencrypt/live/xiayanzheng.com/
docker run -d --network host \
    --name $container_name \
    --restart=always \
    -v /etc/lfapps/trojan:/etc/trojan-go \
    -v /etc/letsencrypt:/etc/letsencrypt:rw teddysun/trojan-go