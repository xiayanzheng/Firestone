hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"prometheus
mkdir -p /root/lfdata/promdata/conf/
weget https://raw.githubusercontent.com/xiayanzheng/Firestone/master/observer/prometheus/prometheus.yml
mv prometheus.yml /root/lfdata/promdata/conf/
docker run -d -p 9090:9090 \
    --network rms-network \
    --name $container_name \
    --restart always \
    -v /root/lfdata/promdata/conf/prometheus.yml:/opt/bitnami/prometheus/conf/prometheus.yml bitnami/prometheus:latest