FROM ubuntu
MAINTAINER ZhangZhenghao <zhangzhenghai@hotmail.com>

# Update packages
COPY apt/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install nginx
RUN apt-get install nginx -y

# Install MySQL
RUN	echo "mysql-server mysql-server/root_password password <password>" | debconf-set-selections ; \
	echo "mysql-server mysql-server/root_password_again password <password>" | debconf-set-selections ; \
	apt-get install mysql-server -y

# Install PHP
RUN apt-get install software-properties-common -y
RUN export LANG=C.UTF-8 && add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install php5.6-fpm -y --allow-unauthenticated
RUN apt-get install php5.6-mysql -y
RUN apt-get install php5.6-curl -y
RUN apt-get install php5.6-gd -y
RUN apt-get install libfreetype6-dev -y

# Config
COPY php-fpm/www.conf /etc/php/5.6/fpm/pool.d/www.conf
COPY php-fpm/php.ini /etc/php/5.6/fpm/php.ini
COPY nginx/default /etc/nginx/sites-available/default

# Deploy
COPY www/ /var/www/
RUN chmod 777 -R /var/www/system/
RUN chmod 777 -R /var/www/system/config/
RUN mkdir /var/www/tmp && chmod 777 -R /var/www/tmp/
RUN mkdir /var/www/cache && chmod 777 -R /var/www/cache/
RUN mkdir /var/www/uploads && chmod 777 -R /var/www/uploads/
RUN service mysql start && mysql -uroot -p'<password>' -e "CREATE DATABASE WeCenter" 

# Run server
CMD service nginx start && service php5.6-fpm start && service mysql start && sleep infinity

EXPOSE 80