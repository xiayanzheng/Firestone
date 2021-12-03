hostname=$(hostname | tr "[:upper:]" "[:lower:]")
postgres_container_name=$hostname"_"postgresql
docker run -d \
    --name $postgres_container_name \
    -e POSTGRES_PASSWORD=$* \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -p 5432:5432
    -v /custom/mount:/var/lib/postgresql/data \
    postgres
docker ps