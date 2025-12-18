docker image build -t php-fpm-mysqli "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape2"

docker container run -d --name data --network monreseau -e MARIADB_RANDOM_ROOT_PASSWORD=yes -e MARIADB_DATABASE=testdb -e MARIADB_USER=testuser -e MARIADB_PASSWORD=testpass -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape2\sql:/docker-entrypoint-initdb.d" mariadb:latest

docker container run -d --name script --network monreseau -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape2\app:/app" php-fpm-mysqli

docker container run -d --name http --network monreseau -p 8080:80 -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape2\app:/app" -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape2\default.conf:/etc/nginx/conf.d/default.conf" nginx:latest