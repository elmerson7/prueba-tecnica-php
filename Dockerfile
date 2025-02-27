FROM php:8.2-cli

# Instala dependencias necesarias
RUN apt-get update \
    && apt-get install -y \
        git \
        unzip \
        libpq-dev \
        libzip-dev \
        zip \
        libonig-dev \
        libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring xml

# Instala Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Configura el directorio de trabajo
WORKDIR /var/www/html

# Expone el puerto para el servidor PHP
EXPOSE 8000

# Comando para mantener el contenedor activo
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
