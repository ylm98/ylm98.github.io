# install service
yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd wget unzip vim

# start service
systemctl start httpd mariadb
systemctl enable httpd mariadb

# database
mysql_pw=root
mysqladmin -uroot password "$mysql_pw"
mysql -uroot -p"$mysql_pw" -e"create database ecshop"

# ecshop
unzip ECShop_V3.0.0_UTF8_release0518.zip
rm -rf /var/www/html
mkdir /var/www/html
cp -rf ECShop_V3.0.0_UTF8_release0518/* /var/www/html
chown -R apache.apache /var/www/html

sed -ri '/date.time/c date.timezone = Asia/Shanghai' /etc/php.ini