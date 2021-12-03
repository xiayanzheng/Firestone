hostname=$(hostname | tr "[:upper:]" "[:lower:]")
postgres_container_name=$hostname"_"postgresql
docker run -d \
    --name $postgres_container_name \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    postgres
docker ps