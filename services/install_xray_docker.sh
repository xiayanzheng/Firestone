hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"xray
mkdir -p /etc/lfapps/xray
docker run -d -p 9006:10086 --name $container_name --restart=always -v /etc/lfapps/xray:/etc/xray teddysun/xray
cat /etc/lfapps/xrayconfig.json