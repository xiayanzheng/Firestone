hostname=$(hostname | tr "[:upper:]" "[:lower:]")
postgres_img_name=$hostname"_"postgresql
docker run -d \
    --name some-postgres \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    $postgres_img_name