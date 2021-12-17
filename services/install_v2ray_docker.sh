hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"v2ray
mkdir -p /etc/lfapps/v2ray
wget https://raw.githubusercontent.com/xiayanzheng/Firestone/master/services/config_files/v2ray/config.json
mv config.json /etc/lfapps/v2ray/
sudo docker run -d \
    --name $container_name \
    -p 8081:8081 \
    -v /etc/lfapps/v2ray:/etc/v2ray:rw \
    -v /etc/lfapps/v2ray:/var/log/v2ray:rw v2fly/v2fly-core