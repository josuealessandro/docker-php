docker login
docker build -t php-apache .
docker tag php-apache josuealessandro/php-apache:8.0
docker push  josuealessandro/php-apache:8.0

docker build -t php-apache .
docker tag php-apache josuealessandro/php-apache:latest
docker push  josuealessandro/php-apache:latest
