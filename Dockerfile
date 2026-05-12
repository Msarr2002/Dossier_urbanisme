# Utiliser l'image PHP officielle avec Apache
FROM php:8.1-apache

# Installer les dépendances de compilation et extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libcurl4-openssl-dev \
    pkg-config \
    && docker-php-ext-install pdo pdo_mysql mysqli curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Activer mod_rewrite pour Apache (si nécessaire pour .htaccess)
RUN a2enmod rewrite

# Copier les fichiers de l'application dans le répertoire web d'Apache
COPY . /var/www/html/

# Donner les permissions appropriées
RUN chown -R www-data:www-data /var/www/html/

# Exposer le port 80
EXPOSE 80