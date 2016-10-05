FROM debian:latest

MAINTAINER Tim Robertson version: 0.0.1
WORKDIR /
ENV IPADDRESS 172.17.0.2
# Configure the base system
RUN apt-get update && apt-get install -y apache2 openssl

# Generate self-signed certificate
RUN openssl req -newkey rsa:2048 -nodes -x509 -subj "/CN=site.local" -keyout /etc/ssl/private/site.key -out /etc/ssl/certs/site.crt

# Configure Apache
ADD site.conf /etc/apache2/sites-available/
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /etc/apache2/sites-available/site.conf /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod ssl

# Get the page
ADD *.html /var/www/html/
# Finish up
EXPOSE 80
EXPOSE 443

CMD ["apachectl", "-D", "FOREGROUND"]
