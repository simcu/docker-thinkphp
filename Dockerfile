FROM ubuntu:14.04
COPY files /home/install
RUN cp -r /home/install/source.list /etc/apt/sources.list && apt-get update && \
	cp -r /home/install/index.php /home/index.php && cp -r /home/install/run.sh /run.sh && \
	chmod +x /run.sh && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd \
	php5-imagick php5-mcrypt php5-redis apache2 && \
	cp -r /home/install/000-default.conf /etc/apache2/sites-enabled/000-default.conf && \
	a2enmod rewrite && service apache2 restart && rm -rf /home/install && apt-get clean
CMD "/run.sh"