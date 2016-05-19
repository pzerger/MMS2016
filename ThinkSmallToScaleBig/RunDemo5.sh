#Before 

docker run --name mysqlwp -e MYSQL_ROOT_PASSWORD=dockerRootMySQL \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_PASSWORD=wordpresspwd \
-d mysql 

docker run --name wordpress --link mysqlwp:mysql -p 80:80 \
-e WORDPRESS_DB_NAME=wordpress \
-e WORDPRESS_DB_USER=wordpress \
-e WORDPRESS_DB_PASSWORD=wordpresspwd \
-d wordpress \



#

sudo nao docker-compose.yml


#After
#docker-compose.yml
wordpress:
  image: wordpress
  links:
    - db:mysql
  ports:
    - 8080:80

db:
  image: mariadb
  environment:
    MYSQL_ROOT_PASSWORD: 'P@ssw0rd1!'


#Deployment
docker-compose up -d

#Validation
docker-compose ps

#Validaiton 2
docker ps

#Validation 3
docker stats

#Stop
docker-compse stop