docker network create freshrss-network
docker volume create freshrss-data
docker volume create freshrss-extensions
docker run -d --restart unless-stopped --log-opt max-size=10m \
  -v freshrss-data:/var/www/FreshRSS/data \
  -v freshrss-extensions:/var/www/FreshRSS/extensions \
  -e 'CRON_MIN=4,34' \
  -e TZ=Asia/Shanghai \
  --net freshrss-network \
  --name freshrss freshrss/freshrss