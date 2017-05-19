docker run --name terry-mysql -v /home/terry/mysql:/var/lib/mysql -e "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" -d --restart always mysql:5.7
docker run --name rubymaze -e "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" -d --restart always rubymaze:latest
