# # Use the official PHP image with FPM
# FROM php:8.1-fpm

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     unixodbc-dev \
#     gnupg \
#     apt-transport-https \
#     curl

# # Install the Microsoft ODBC driver for SQL Server
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt-get update \
#     && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
#     && apt-get clean

# # Install PHP extensions required for MSSQL
# RUN docker-php-ext-install pdo pdo_sqlsrv

# # Set working directory
# WORKDIR /var/www

# # Copy the application files
# COPY . .

# # Install PHP dependencies
# RUN composer install

# # Expose port 9000 and start PHP-FPM server
# CMD ["php-fpm"]

# EXPOSE 9000
# ---------------V_1

# Use the official PHP image with FPM
# FROM php:8.1-fpm

# # Update package lists and install system dependencies
# RUN apt-get update && apt-get install -y \
#     gnupg \
#     apt-transport-https \
#     unixodbc-dev \
#     curl \
#     libpq-dev \
#     && apt-get clean

# # Add Microsoft ODBC repository and install the driver
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt-get update \
#     && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
#     && apt-get clean

# # Install PHP extensions required for MSSQL
# RUN docker-php-ext-install pdo pdo_sqlsrv

# # Set working directory
# WORKDIR /var/www

# # Copy the application files
# COPY . .

# # Install PHP dependencies
# RUN composer install

# # Expose port 9000 and start PHP-FPM server
# CMD ["php-fpm"]

# EXPOSE 9000
# ---------------V_2

# FROM php:8.1-apache

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     gnupg \
#     apt-transport-https \
#     curl \
#     unixodbc-dev \
#     libgssapi-krb5-2 \
#     && apt-get clean

# # Remove any conflicting ODBC packages to avoid installation errors
# RUN apt-get remove -y \
#     libodbc2 \
#     libodbccr2 \
#     libodbcinst2 \
#     unixodbc-common \
#     && apt-get autoremove -y \
#     && apt-get clean

# # Add Microsoft ODBC repository
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt-get update

# # Install Microsoft ODBC Driver and necessary libraries
# RUN ACCEPT_EULA=Y apt-get install -y \
#     msodbcsql17 \
#     unixodbc \
#     unixodbc-dev \
#     libodbc1 \
#     odbcinst \
#     odbcinst1debian2 \
#     && apt-get clean

# # Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Install the pdo_sqlsrv PHP extension from Microsoft
# RUN pecl install sqlsrv pdo_sqlsrv \
#     && docker-php-ext-enable sqlsrv pdo_sqlsrv

# # Set working directory
# WORKDIR /var/www

# # Copy the application files
# COPY . .

# # Install PHP dependencies
# RUN composer install

# # Enable Apache mod_rewrite
# RUN a2enmod rewrite

# # Expose port 80
# EXPOSE 80

# # Start Apache server
# CMD ["apache2-foreground"]
# ---------------V_3

# FROM php:8.1-apache

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     gnupg \
#     apt-transport-https \
#     curl \
#     unixodbc-dev \
#     libgssapi-krb5-2 \
#     && apt-get clean

# # Remove any conflicting ODBC packages to avoid installation errors
# RUN apt-get remove -y \
#     libodbc2 \
#     libodbccr2 \
#     libodbcinst2 \
#     unixodbc-common \
#     && apt-get autoremove -y \
#     && apt-get clean

# # Add Microsoft ODBC repository
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt-get update

# # Install Microsoft ODBC Driver and necessary libraries
# RUN ACCEPT_EULA=Y apt-get install -y \
#     msodbcsql17 \
#     unixodbc \
#     unixodbc-dev \
#     libodbc1 \
#     odbcinst \
#     odbcinst1debian2 \
#     && apt-get clean

# # Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Install the pdo_sqlsrv PHP extension from Microsoft
# RUN pecl install sqlsrv pdo_sqlsrv \
#     && docker-php-ext-enable sqlsrv pdo_sqlsrv

# # Set working directory
# WORKDIR /var/www

# # Copy the application files
# COPY . .


# # Install PHP dependencies
# RUN composer install --no-dev --optimize-autoloader \
#     && ls -la /var/www/vendor

# # Set permissions for Laravel directories
# RUN chown -R www-data:www-data /var/www \
#     && chmod -R 755 /var/www \
#     && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# # Enable Apache mod_rewrite
# RUN a2enmod rewrite

# # Update Apache to use /var/www/public as the DocumentRoot
# RUN sed -i 's|/var/www/html|/var/www/public|g' /etc/apache2/sites-available/000-default.conf

# # Set ServerName to localhost to avoid warning
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# # Expose port 80
# EXPOSE 80

# # Start Apache server
# CMD ["apache2-foreground"]
# ---------------V_4

# Use the official PHP image with Apache
# FROM php:8.1-apache
# Use the official PHP image with Apache
FROM php:8.2.22-apache

# Install system dependencies and required tools
RUN apt-get update && apt-get install -y \
    gnupg \
    apt-transport-https \
    curl \
    git \
    unzip \
    zip \
    libzip-dev \
    unixodbc-dev \
    libgssapi-krb5-2 \
    && apt-get clean

# Remove any conflicting ODBC packages to avoid installation errors
RUN apt-get remove -y \
    libodbc2 \
    libodbccr2 \
    libodbcinst2 \
    unixodbc-common \
    && apt-get autoremove -y \
    && apt-get clean

# Add Microsoft ODBC repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update

# Install Microsoft ODBC Driver and necessary libraries
RUN ACCEPT_EULA=Y apt-get install -y \
    msodbcsql18 \
    unixodbc \
    unixodbc-dev \
    libodbc1 \
    odbcinst \
    odbcinst1debian2 \
    && apt-get clean

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set Composer environment variables
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install the pdo_sqlsrv PHP extension from Microsoft
RUN pecl install sqlsrv pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv \
    && docker-php-ext-install zip

# Set working directory
WORKDIR /var/www

# Copy the application files
COPY . .

# Install PHP dependencies with optimized autoloading
RUN composer install --no-dev --optimize-autoloader \
    && composer dump-autoload --optimize \
    && php artisan storage:link \
    && php artisan optimize:clear \
    && php artisan optimize \
    && ls -la /var/www/vendor

# Set permissions for Laravel directories
RUN chown -R www-data:www-data /var/www

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Update Apache to use /var/www/public as the DocumentRoot
RUN sed -i 's|/var/www/html|/var/www/public|g' /etc/apache2/sites-available/000-default.conf

# Set ServerName to localhost to avoid warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
