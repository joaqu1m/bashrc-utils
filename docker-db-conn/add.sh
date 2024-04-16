echo '
conndb() {
container_id=$(docker ps -q)
if [ $(echo "$container_id" | wc -l) -ne 1 ]; then
    echo "Error: Must have exactly one container running"
    return 1
fi

container_name=$(docker inspect --format="{{.Name}}" $container_id)
db_image=$(docker inspect --format="{{.Config.Image}}" $container_id)
if [[ "$db_image" != *"mysql"* && "$db_image" != *"postgres"* ]]; then
    echo "Error: The running container does not have a MySQL or Postgres image"
    return 1
fi

db_ip=$(docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $container_id)
if [[ "$db_image" == *"mysql"* ]]; then
    echo "Connecting to MySQL container $container_name at $db_ip"
    mysql -u root -p -h $db_ip
elif [[ "$db_image" == *"postgres"* ]]; then
    echo "Connecting to Postgres container $container_name at $db_ip"
    psql -h $db_ip -U postgres
fi
}
' >> ~/.bashrc