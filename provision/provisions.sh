#!/usr/bin/env bash

locale-gen UTF-8

echo "Updating packages"
aptitude -y update > /dev/null
aptitude -y safe-upgrade > /dev/null
echo "Done!"

echo "Installing Nginx"
aptitude install -y nginx > /dev/null
echo "Installing Git" > /dev/null
aptitude install -y git > /dev/null

echo "Installing PHP with some extensions"
aptitude install -y php5-common php5-dev php5-cli php5-fpm > /dev/null
aptitude install -y curl php5-curl php5-mysql php5-mcrypt > /dev/null

echo "Installing and setting up MySQL. Password is toor"
// Set the MySQL credentials here before installing
aptitude -y install debconf-utils > /dev/null
debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'
aptitude install -y mysql-server > /dev/null


if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/public_html /var/www
fi

echo "Installing and configuring Mailcatcher. Go to [YOUR_IP]:1080 to see the web interface"
aptitude -y install ruby-dev
aptitude -y install libsqlite3-dev
gem install mailcatcher
mailcatcher --http-ip 192.168.0.199 --smtp-ip 127.0.0.1
sed -i "s/;sendmail_path =/sendmail_path = \/usr\/local\/bin\/catchmail -f dev@your.nginx.server/" /etc/php5/fpm/php.ini
service php5-fpm restart


echo "Configuring Nginx"
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart
echo "Done!"


