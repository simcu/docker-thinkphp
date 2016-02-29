FROM ubuntu:14.04
COPY files /home/install
RUN cp -r /home/install/source.list /etc/apt/sources.list && apt-get update && \
	cp -r /home/install/index.php /home/index.php && cp -r /home/install/run.sh /run.sh && \
	chmod +x /run.sh && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd \
	php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-redis \
	php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl apache2 && \
	cp -r /home/install/000-default.conf /etc/apache2/sites-enabled/000-default.conf && \
	a2enmod rewrite && service apache2 restart && rm -rf /home/install && apt-get clean
CMD "/run.sh"