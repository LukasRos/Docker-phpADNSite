FROM jadoos/php-app-base
MAINTAINER "Lukas Rosenstock" <lr@lukasrosenstock.net>

# Install GIT and composer
RUN yum install -y git

# Install phpADNSite
RUN mkdir -p /var/www/app && cd /var/www/app \
  && git clone https://github.com/LukasRos/phpADNSite.git \
  && ln -s phpADNSite web && cd web \
  && curl -sS https://getcomposer.org/installer | php \
  && php composer.phar install -o

# Set up setup script
ADD setup.sh /tmp/

# Launch setup script
ENTRYPOINT ["/bin/sh", "/tmp/setup.sh"]
