# install service
yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd

# start service
systemctl start httpd mariadb
systemctl enable httpd mariadb

# database
mysql_pw=root
mysqladmin -uroot password "$mysql_pw"
mysql -uroot -p"$mysql_pw" -e"create database wordpress"

# wordpress
wget https://cn.wordpress.org/wordpress-4.9.4-zh_CN.tar.gz
tar xf wordpress-4.9.4-zh_CN.tar.gz
rm -rf /var/www/html
mkdir /var/www/html
cp -rf wordpress/* /var/www/html
chown -R apache.apache /var/www/html