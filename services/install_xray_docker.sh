hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"xray
mkdir -p /etc/lfapps/xray
wget https://raw.githubusercontent.com/xiayanzheng/Firestone/master/services/config_files/xray/config.json
mv config.json /etc/lfapps/xray/
docker run -d \
    -p 9006:10086 \
    --name $container_name \
    --restart=always \
    -v /etc/lfapps/xray:/etc/xray teddysun/xray
cat /etc/lfapps/xray/config.json