FROM php:8.2-apache

# Installation des bibliothèques système pour extensions PHP
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libgd-dev \
    libicu-dev \
    libonig-dev \
    libcurl4-openssl-dev \
    libzip-dev \
    unzip \
    zip \
    curl \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        gd \
        mbstring \
        intl \
        pdo_mysql \
        mysqli \
        curl \
        zip

# Installation de l'extension APCu via PECL
RUN pecl install apcu \
    && docker-php-ext-enable apcu

# Installation de Composer dans le conteneur
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Activation des modules Apache utiles
RUN a2enmod ssl \
    && a2enmod rewrite \
    && a2ensite default-ssl


RUN git config --global --add safe.directory /var/www/html    

# Définition du répertoire de travail
WORKDIR /var/www/html

# Copie du projet
COPY . .

# Commande de démarrage
CMD ["apache2-foreground"]
