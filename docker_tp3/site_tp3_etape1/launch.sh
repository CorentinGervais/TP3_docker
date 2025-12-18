docker network create monreseau

docker container run -d --name script --network monreseau -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape1:/app" php:8.2-fpm

docker container run -d --name http --network monreseau -p 8080:80 -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape1:/app" -v "C:\Users\Coren\OneDrive\Bureau\docker_tp3\site_tp3_etape1\default.conf:/etc/nginx/conf.d/default.conf" nginx:latest

nginx:latest

location ~ \.php$ {
    root /app;
    fastcgi_pass script:9000;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
}



