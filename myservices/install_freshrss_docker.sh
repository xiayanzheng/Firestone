hostname=$(hostname | tr "[:upper:]" "[:lower:]")
container_name=$hostname"_"node_exporter
docker network create freshrss-network
docker volume create freshrss-data
docker volume create freshrss-extensions
docker run -d --restart unless-stopped --log-opt max-size=10m \
  -v freshrss-data:/var/www/FreshRSS/data \
  -v freshrss-extensions:/var/www/FreshRSS/extensions \
  -e 'CRON_MIN=4,34' \
  -e TZ=Asia/Shanghai \
  -p 8080:80 \
  --net freshrss-network \
  --name $container_name freshrss/freshrss