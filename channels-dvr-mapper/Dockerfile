# channels-dvr-mapper/Dockerfile
FROM php:8.2-apache

# Install required PHP extensions and tools
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libcurl4-openssl-dev \
    libxml2-dev \
 && docker-php-ext-install zip curl xml mbstring pdo pdo_mysql pdo_sqlite \
 && a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
COPY . /var/www/html/

# Install PHP dependencies and set permissions
RUN composer install --no-dev --optimize-autoloader \
 && chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
