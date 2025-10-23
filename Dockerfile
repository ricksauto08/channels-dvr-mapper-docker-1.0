FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libzip-dev \
    unzip \
    libcurl4-openssl-dev \
    libxml2-dev \
    libonig-dev \
    libsqlite3-dev \
 && docker-php-ext-install zip curl xml mbstring pdo pdo_mysql pdo_sqlite \
 && a2enmod rewrite \
 && rm -rf /var/lib/apt/lists/*

# Install Composer globally (still useful for manual use)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
