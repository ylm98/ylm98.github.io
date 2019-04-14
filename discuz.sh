# install service
yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd wget unzip vim

# start service
systemctl start httpd mariadb
systemctl enable httpd mariadb

# database
mysql_pw=root
mysqladmin -uroot password "$mysql_pw"
mysql -uroot -p"$mysql_pw" -e"create database discuz"

# discuz
wget http://download.comsenz.com/DiscuzX/2.5/Discuz_X2.5_SC_UTF8.zip
unzip  Discuz_X2.5_SC_UTF8.zip
rm -rf /var/www/html
mkdir /var/www/html
cp -rf upload/* /var/www/html
chown -R apache.apache /var/www/html